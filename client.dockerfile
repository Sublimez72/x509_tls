# SPDX-FileCopyrightText: © 2023 Menacit AB <foss@menacit.se>
# SPDX-License-Identifier: CC-BY-SA-4.0
# X-Context: Practical cryptography course - X.509/TLS lab

# Install required dependencies for client script
FROM docker.io/library/alpine:3.17.1
RUN apk add --update-cache bash curl curl-doc mandoc
COPY client.sh /root/
COPY /pki/issued/client.crt /etc/ssl/certs/
COPY pki/private/client.key /etc/ssl/certs/
COPY pki/ca.crt /etc/ssl/certs/
CMD ["/bin/bash", "/root/client.sh"]
