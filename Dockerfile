## Nginx container to test webserv

FROM alpine:3.12.0
LABEL project=nginx_webserv
LABEL service=nginx

# DEFINES
ENV DEBIAN_FRONTEND="noninteractive"

# INSTALL ALL PACKAGED
RUN apk update && apk upgrade && apk add tzdata nginx openssh openssh-server supervisor zsh curl
RUN mkdir -p /run/nginx/

#ssh
EXPOSE 22
#web
EXPOSE 80
EXPOSE 8080
EXPOSE 17000

# UPDATE CONTAINER TIMEZONE FOR SSL
ENV TZ Europe/Paris
RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime

# SSH CONFIGURATION
RUN ssh-keygen -A && passwd -d root
RUN mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys
ADD ./ssh/webserv_testenv.pub /root/.ssh/webserv_testenv.pub
RUN cat ~/.ssh/webserv_testenv.pub > /root/.ssh/authorized_keys
ADD ./ssh/banner /etc/motd
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
 	&& echo "AllowUsers root OtherUser" >> /etc/ssh/sshd_config

# SUPERVISORD CONFIGURATION
COPY ./supervisor/kill.sh /bin/kill.sh
RUN mkdir -p /etc/supervisor/conf.d/
ADD ./supervisor/supervisor.conf /etc/supervisor/conf.d/

CMD /usr/bin/supervisord -c /tmp/supervisor/supervisor.conf
