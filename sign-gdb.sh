# installing gdb-cert into system keystore

sudo security add-trusted-cert -d -r trustRoot -k \
  "/Library/Keychains/System.keychain" \
  "gdb-cert.cer"

#gdb codesigning
pid=`ps -e | grep taskgated | head -1 | awk '{print $1;}'`

#killing taskgated

echo "Killing taskgated process, you might need to restart anyways"

if [ -n $pid ] ; then
 sudo kill -9 $pid
fi

#signing gdb
echo "Now signing gdb, please enter your username and password"
code=`codesign -s gdb-cert $(which gdb)`
