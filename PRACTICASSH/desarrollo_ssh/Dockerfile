FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y openssh-server libpam-google-authenticator && \
    mkdir /var/run/sshd

RUN useradd -m desarrollador && echo 'desarrollador:clave123' | chpasswd

COPY entrypoint.sh /entrypoint.sh
COPY config/google-auth-setup.sh /google-auth-setup.sh

RUN chmod +x /entrypoint.sh /google-auth-setup.sh

EXPOSE 22

CMD ["/entrypoint.sh"]
