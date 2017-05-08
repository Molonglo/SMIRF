#!/bin/csh
cd /data/mopsr/rawdata

foreach bp ( `ls -1d BP*/` )
    echo "checking $bp"
   foreach utc ( `ls -1d $bp/2*/` )
	echo "checking $utc"
        
	if("$utc" == "2017-05-07-06:00:50") continue
	if("$utc" == " 2017-05-07-12:38:02") continue

	ls $utc/FB/obs.*
	if ( -f $utc/FB/obs.completed ) then
	    echo "transferring $bp/$utc"
	   touch $utc/FB/obs.peasouped
	endif

	if ( -f $utc/FB/obs.peasouped) then
            echo "transferring $bp/$utc"
	    touch $utc/FB/obs.completed
        endif

	
	
   end
end
