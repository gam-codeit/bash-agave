#!/bin/bash
#Gamboa2018
#Install FlameMaster in all Agave's Compute nodes 
bisonPath="/home/admin/packages/bison-devel-3.0.4-1.el7.x86_64.rpm"
flexPath="/home/admin/packages/flex-devel-2.5.37-3.el7.x86_64.rpm"
sundialsPath="/export/sundials-2.4.0"
entornoFlame="/etc/profile.d/FlameManExports.sh"
instdir="/opt/sundials-2.4"
host=$(hostname)

if test $(id -u) -eq 0 && test "$host" = "agave.itver.edu.mx" 
	then
	xdcp compute $entornoFlame $entornoFlame
	yum -y install byacc $bisonPath $flexPath gcc gcc-c++ cmake make &> log.out
	sleep 5
	cd $sundialsPath/buildir
	cmake $sundialsPath -DCMAKE_INSTALL_PREFIX=$instdir
	cd /export/FlameMaster
	./Install.bash &> flamelog.out

	else 
	echo "Debe correr este script en el FrontEnd y como superusuario"
fi

