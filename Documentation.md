
First thing I did was creating all the certificates and signing them with easy-rsa.

I ran the commands:

easy-rsa pki-init  <br />
easy-rsa build-ca nopass  <br />
easy-rsa gen-req {servername} nopass  <br />
I made sure that the DN of the server is the same as the one the client curls.  <br />
easy-rsa gen-req {clientname} nopass  <br />
easy-rsa sign-req server {servername} nopass  <br />
easy-rsa sign-req client {clientname} nopass  <br />
easy-rsa gen-crl nopass  <br />


After I did this I edited the files: docker-compose.yml and client.dockerfile 
so that the certificates and all the necessary files were copied to each machine.

Finally I edited the server.conf and client.sh file to implement ssl.

I did this by changing the curl command by adding flags that take the certificates and crl as inputs and changing the address that it curls to so that it does so using https and not http.

Finally for the webserver I changed it so that it listens on port 443, I only allowed TLSv1.2 and TLSv1.3.
I added the links to all the certificates and created a custom logformat. I also added in the client verification and the crl.pem file.


Curl without TLS handshake or certificates.
![NO_TLS](/pics/before.png)

Curl with TLS handshake and certificates.
![TLS](/pics/after.png)