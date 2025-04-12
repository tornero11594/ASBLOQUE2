#!/bin/bash
set -e

/google-auth-setup.sh

echo "UsePAM yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "ChallengeResponseAuthentication yes" >> /etc/ssh/sshd_config
echo "KbdInteractiveAuthentication yes" >> /etc/ssh/sshd_config
echo "AuthenticationMethods password" >> /etc/ssh/sshd_config

# Desactiva momentáneamente el OTP
echo "auth required pam_google_authenticator.so" >> /etc/pam.d/sshd

/usr/sbin/sshd -D
