#!/bin/sh
# Inicia o broker MQTT em background
mosquitto -c /etc/mosquitto/mosquitto.conf &

# Inicia o servidor do dashboard
http-server . -p 8080
