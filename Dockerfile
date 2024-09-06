FROM registry.access.redhat.com/ubi9-minimal:9.4-1227

COPY backup.sh /usr/local/bin/backup.sh

RUN microdnf update -y && rm -rf /var/cache/yum
RUN microdnf install findutils -y && microdnf clean all
RUN curl -O https://dl.min.io/client/mc/release/linux-amd64/mc.rpm \
 && rpm -ih mc.rpm \
 && rm mc.rpm

CMD ["/usr/local/bin/backup.sh"]
