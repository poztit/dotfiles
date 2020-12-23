#!/bin/bash
host="192.168.1.1"
port="8080"
username="admin"
password="admin"
cachedir=~/.cache/
cookiefile=.qbitstats_cookie

if [ ! -f `which jq` ]; then
        echo "Exiting.. Please install 'jq' JSON processor"
        exit
fi

if [ ! -d $cachedir ]; then
    mkdir -p $cachedir
fi

IFS=$'\r\n'

if [ ! -f $cachedir/$cookiefile ]; then
        resp=($(curl --fail -i --header \
                "Referer: "http://$host:$port"" \
                --data "username=$username&password=$password" \
                "http://$host:$port/login" \
                2>/dev/null))

        if [[ $resp =~ "Fails." ]]; then
                echo -e "{\"text\":\"" Login failed"\"}"
                exit
        fi

        echo ${resp[7]} | awk -F 'SID=' '{print $2}' | cut -f1 -d\; > $cachedir/$cookiefile
fi


cookie=$(cat $cachedir/$cookiefile)
data=($(curl -s -i --cookie "SID=$cookie" "http://"$host:$port"/query/transferInfo"))

if [[ ${data[0]} =~ "Forbidden" ]]; then
        rm $cachedir/$cookiefile
        echo -e "{\"text\":\"" Refreshing cookie"\"}"
        exit
fi

for i in ${!data[@]}; do
        if [[ ${data[$i]} =~ "dl_info_speed" ]]; then
                speed=($(echo ${data[$i]} | jq --args '.dl_info_speed, .up_info_speed, .dl_info_data, .up_info_data'))
                dl_speed=$(numfmt --to=si ${speed[0]})
                up_speed=$(numfmt --to=si ${speed[1]})
                dl_info_data=$(numfmt --to=si ${speed[2]})
                up_info_data=$(numfmt --to=si ${speed[3]})
                echo -e "{\"text\":\"" $dl_speed/s   $up_speed/s"\", \"alt\":\"" $dl_info_data  $up_info_data"\"}"
        fi
done

