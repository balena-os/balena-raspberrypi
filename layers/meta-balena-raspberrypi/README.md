# Resin.io layer for meta-raspberrypi supported boards

## Description
This repository enables building BalenaOS for chosen meta-raspberrypi machines.

## Supported machines
* fincm3
* raspberrypi
* raspberrypi2
* raspberrypi3

## How to?

Q: I generated an image without debug or I downloaded a Balena image from the production dashboard. How can I login over serial port?
A: We don't start getty on non debug images. As well there are passward changes for root user needed. In order to simplify this process, there is a helper script https://github.com/balena-os/serial-it which does everything for you. Check the help message of that script.
