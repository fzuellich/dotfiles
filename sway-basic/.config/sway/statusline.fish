#!/usr/bin/fish
set date (date +'%Y-%m-%d %H:%M:%S')

#
#
#
timew > /dev/null
set trackingInactive $status
set trackedTime (timew day | grep Tracked | awk '{print $2}')
set workedHours (echo "$trackedTime" | cut -d ':' -f 1)
# Minimum of 10% alpha for 0 hours, then increase every hour
set trackedAlpha (math -s0 "max(10, ($workedHours / 8) * 100)")
set trackingSnippet "<span foreground=\"#c0ff00\" alpha=\"$trackedAlpha%\">$trackedTime</span>"
if test $trackingInactive -eq 1
    set trackingSnippet "<span foreground=\"red\">$trackedTime</span>"
end

#
#
#
set network (grep domain /etc/resolv.conf | awk '{print $2}')

echo " \
$date // \
$trackingSnippet // \
@$network"
