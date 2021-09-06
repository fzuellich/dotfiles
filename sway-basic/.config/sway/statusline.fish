#!/usr/bin/fish
set date (date +'%Y-%m-%d %H:%M:%S')
set trackedTime (timew day | grep Tracked | awk '{print $2}')
set network (grep domain /etc/resolv.conf | awk '{print $2}')

echo "
$date // \
<span foreground=\"lime\">$trackedTime</span> // \
@$network"
