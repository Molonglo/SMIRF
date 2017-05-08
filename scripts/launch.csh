#!/bin/csh

if($#argv < 3)then
   echo  "./launch.csh <program> <range/nodes> <start_server> <end_server>"
   exit
endif
    

set run = "$1"
echo -n "runnning $run"

set nodes = ()

if($2 == "range") then
    set start = "$3"
    set end = "$4"
    set nodes = ( `seq $start $end` )

else
    shift
    shift
    set nodes = ($*)

endif

echo "nodes = $nodes"


foreach i( $nodes )
    set server = "mpsr-bf0"$i
    xterm -bg black -fg orange -title $server -hold -e /usr/bin/ssh $server "$run" &
end
