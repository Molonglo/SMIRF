#!/bin/csh

set dirs = `find /smirf/results/ -maxdepth 2 -mindepth 2`

foreach dir( $dirs )

    set pointing = `echo $dir | awk -F/ '{print $(NF-1)}'`

    set utc = `echo $dir | awk -F/ '{print $NF}'`

    echo "processing utc: $utc of pointing: $pointing"

    cd $dir/cars

    if( -f obs.pdmped && `ls $dir/obs.transferred.BS* | wc -l | awk '{print $1}'` == 9 ) continue

    if( `ls $dir/obs.transferred.BS* | wc -l | awk '{print $1}'` < 9 ) continue

    rm -f pdmp.screen

    
    foreach car ( *.car )
    
	set name = `echo $car | awk -F. '{ print $1 }'`

	echo "name: " $name


	pdmp -g "${name}.png/PNG" $car | tee -a  pdmp.screen

	if( $? != 0 ) then

	echo "PDMP failed on car: " $car

	endif
    
    end

    
    echo "done with utc: $utc of pointing: $pointing"
    touch $dir/cars/obs.pdmped



    cd -

end

