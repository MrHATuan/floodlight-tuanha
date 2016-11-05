#! /usr/bin/env bash

#tmux new-session -d -s floodlight 'cd ~/acloud;sudo java -jar target/floodlight.jar'\; split-window -d \; attach;

tmux new -s floodlight -d -n run 'cd ~/acloud;sudo java -jar target/floodlight.jar';
tmux set -t floodlight set-remain-on-exit on;
tmux neww -a -n RestAPI -t run "sleep 30;cd ~/acloud/example;python lb_test.py"\;
tmux neww -a -n topo -t RestAPI "cd ~/acloud/example;python lb-topcrt.py";
