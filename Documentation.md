
First thing I did was creating all the certificates and signing them with easy-rsa.

I ran the commands:

easy-rsa pki-init
easy-rsa build-ca nopass
easy-rsa gen-req {servername} nopass
easy-rsa gen-req {clientname} nopass
easy-rsa sign-req server {servername} nopass
easy-rsa sign-req client {clientname} nopass
easy-rsa gen-crl nopass


After I did this I edited the files: docker-compose.yml and client.dockerfile
so that the certificates and all the necessary files were copied to each machine.

