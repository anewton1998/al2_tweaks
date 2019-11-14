#!/bin/bash
#sleep 20s
killall conky
cd "/home/andy/.conky/Gotham"
conky -c "/home/andy/.conky/Gotham/Gotham" &
cd "/home/andy/.conky/TeejeeTech"
conky -c "/home/andy/.conky/TeejeeTech/CPU Panel (2-core)" &
cd "/home/andy/.conky/keys"
conky -c "/home/andy/.conky/keys/keys" &
