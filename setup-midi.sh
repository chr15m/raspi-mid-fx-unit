#!/bin/sh

ctrl_chan=`aconnect -lo | grep UC-33 | grep client | cut -f 2 -d" "`
pd_chan=`aconnect -li | grep "Pure Data" | grep client | cut -f 2 -d" "`

aconnect ${ctrl_chan}0 ${pd_chan}1
aconnect ${ctrl_chan}1 ${pd_chan}0
