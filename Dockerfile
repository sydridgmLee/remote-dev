FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update &&  apt install -y locales

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8     

RUN apt update && apt install -y libopencv-dev

## sshd
RUN apt update && apt install  openssh-server -y

COPY id_rsa.pub /root/.ssh/authorized_keys
RUN chown root:root -R /root/.ssh && \
    chmod 600 /root/.ssh/authorized_keys

RUN service ssh start
# Expose docker port 22
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
