clear
 	interface=eth0 ## Change To Your network Interface
 	dumpdir=/tmp/
 		while /bin/true; do
 		pkt_old=`grep $interface: /proc/net/dev | cut -d : -f2 | awk '{ print $2 }'`
 		sleep 1
 		pkt_new=`grep $interface: /proc/net/dev | cut -d : -f2 | awk '{ print $2 }'`
 		pkt=$(($pkt_new-$pkt_old))
 			echo -ne "\r$pkt packets/s\033[0K"
 			if [ $pkt -gt 10200 ]; then  ## If Over 100 Megabyte, Alerts Discord Webhook
 			echo -e "\n`date` Under attack, dumping packets." 
 			python3 msg.py ## Shows Main MSG Abt Webserver Being Hit
 		pktT=$(($pkt/"102"))
 		msg_content=\"Dumping" "$pktT" "Megabytes\" ## Sends The Msg About It Being Hit
 		url='https://discordapp.com/api/webhooks/PUT WEBHOOK HERE' ## Insert Webhook Here
 		curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url ## Shows How Much Power Being Put Through
 	tcpdump -n -s0 -c 2000 -w $dumpdir/dump.`date +"%Y%m%d-%H%M%S"`.cap ## Dumps All Invalid Connected IP's And Forced Connections
 echo "`date` Just Got Hit [Sleeping For 1 Min]."
 sleep 60
 fi
done