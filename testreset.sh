#!/bin/bash

echo “Checking SMS Cache”

if [ “$(mmcli –modem 0 –messaging-list-sms)” == “No sms messages were found” ]
then
	echo “No sms messages were found.”
else
for smsmsg in ‘mmcli –modem 0 –messaging-list-sms’; do
	if [ $smsmsg != “(received)” ] | [ $smsmsg != “(receiving)” ]
	then
		echo “Delete sms=” $(basename $smsmsg)
		echo $smsmsg
		mmcli –modem 0 –messaging-delete-sms=$(basename $smsmsg)
	fi
done
fi


#End
