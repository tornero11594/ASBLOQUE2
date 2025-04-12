FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd

RUN useradd -m usuario && mkdir -p /home/usuario/.ssh

COPY config/authorized_keys /home/usuario/.ssh/authorized_keys

RUN chown -R usuario:usuario /home/usuario/.ssh && \
    chmod 700 /home/usuario/.ssh && \
    chmod 600 /home/usuario/.ssh/authorized_keys

RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config && \
    echo "PermitRootLogin no" >> /etc/ssh/sshd_config && \
    echo "AllowUsers usuario" >> /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
