#!/bin/bash

USER=desarrollador
HOME_DIR=/home/$USER

# Configura Google Authenticator para el usuario
runuser -l $USER -c "yes | google-authenticator -t -d -f -r 3 -R 30 -W"

chown -R $USER:$USER $HOME_DIR
