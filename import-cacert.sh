wget http://www.cacert.org/certs/root.crt
wget http://www.cacert.org/certs/class3.crt

#TODO validate sha256 of files

sudo security add-trusted-cert -d -r trustRoot -k "/Library/Keychains/System.keychain" root.crt
sudo security add-trusted-cert -d -r trustRoot -k "/Library/Keychains/System.keychain" class3.crt