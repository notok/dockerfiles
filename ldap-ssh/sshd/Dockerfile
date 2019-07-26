FROM alpine:edge

RUN apk add --no-cache openssh bash curl
# make sure we get fresh keys
RUN rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key
ADD docker-entrypoint.sh /

EXPOSE 22
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd","-D","-e"]
