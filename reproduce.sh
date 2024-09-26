#!/bin/sh

./sslecho s &

# Works
echo "TEST1" | env SSL_CERT_DIR="$(readlink -f ca-trust/certs)" SSL_CERT_FILE="$(readlink -f ca-trust/certs-empty.pem)" ./sslecho c 127.0.0.1
echo "TEST2" | env SSL_CERT_DIR="$(readlink -f ca-trust/certs)" SSL_CERT_FILE="$(readlink -f ca-trust/certs-with-ca.pem)" ADDITIONAL_CA="$(readlink -f otherca.pem)" ./sslecho c 127.0.0.1
# Broken
echo "TEST3" | env SSL_CERT_DIR="$(readlink -f ca-trust/certs)" SSL_CERT_FILE="$(readlink -f ca-trust/certs-empty.pem)" ADDITIONAL_CA="$(readlink -f otherca.pem)" ./sslecho c 127.0.0.1
