#!/bin/bash

declare -x HOME="/home/chrism"
declare -x LANG="en_GB.UTF-8"
declare -x LOGNAME="chrism"
declare -x MAIL="/var/mail/chrism"
declare -x OLDPWD
declare -x PATH="/home/chrism/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games"
declare -x PWD="/home/chrism"
declare -x SHELL="/bin/bash"
declare -x SHLVL="1"
declare -x USER="chrism"

if [ "$DISPLAY" == "" ]
then
	gui='-nogui'
fi

echo Launching Pd fx unit "$gui"

cd "$( dirname "${BASH_SOURCE[0]}" )"
pwd
./stereo.sh
pd -open _main.pd -alsamidi -midiindev 0,1,2,3,17,18 $gui $@ &
renice -n -19 -u chrism
sleep 1
echo 3
sleep 1
echo 2
sleep 1
echo 1
sleep 1
./setup-midi.sh
echo done
