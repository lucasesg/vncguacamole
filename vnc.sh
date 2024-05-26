#!/bin/bash

echo "

#########################################
#
#
#	SCRIPT DE INSTALAÇÃO VNC BY
#
#	 Ａｌｌｇｅｎｉｕｓ
#
#
#########################################
"

sleep 7

# Atualizar o sistema

sudo apt update

# Instalar LightDM

sudo apt install lightdm

# Instalar x11vnc

sudo apt install x11vnc

# Criar o arquivo de serviço para x11vnc

echo "[Unit]
Description=x11vnc service
After=display-manager.service network.target syslog.target

[Service]
Type=simple
ExecStart=/usr/bin/x11vnc -forever -display :0 -auth guess -passwd abc,123
ExecStop=/usr/bin/killall x11vnc
Restart=on-failure

[Install]
WantedBy=multi-user.target" | sudo tee /lib/systemd/system/x11vnc.service

sleep 2

sudo systemctl daemon-reload
sudo systemctl restart x11vnc.service /
sudo systemctl stop x11vnc.service /
sudo systemctl enable x11vnc.service /
sudo systemctl start x11vnc.service

sleep 2

# Escrever texto lightdm.conf

echo "[SeatDefaults]
# desativar login convidado

allow-guest=false

# login automático

autologin-user="nomePDV"

# tempo para o autologin

autologin-user-timeout=0
user-session=Lubuntu
greeter-session=lightdm-gtk-greeter" | sudo tee /etc/lightdm/lightdm.conf

sleep 2

# configurar nome pdv

sudo nano /etc/lightdm/lightdm.conf

sleep 3
sudo systemctl status x11vnc.service
# Reiniciar

# echo "⚠ EM 10 SEGUNDOS O PDV LINUX VAI REINICIAR PARA APLICAR TODA INSTALAÇÃO ⚠"

sleep 10

# sudo systemctl reboot
