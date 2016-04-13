#!/bin/sh

# Set the CAPSLOCK keyboard button to 'No Action' for every known keyboard. The VendorID/ProductID combination is required.

keyboards="$(ioreg -n IOHIDKeyboard -r | grep -e 'class IOHIDKeyboard' -e VendorID\" -e ProductID)"
domains="$(echo \"${keyboards}\" | grep -o -E '"VendorID" = [0-9]*|"ProductID" = [0-9]+' | awk '{print $3}' | xargs -n1 | paste - - | xargs -n2  printf 'com.apple.keyboard.modifiermapping.%d-%d-0\n')"

if [ -z "$domains" ]; then
	echo "No keyboards found."
	exit 0
fi;

echo "Generated the following domains:"
for domain in $domains; do
  echo " - $domain"
done;

read -p "Proceed? (Y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Nn] ]]; then
  echo "Aborted."
  exit 0
fi;

echo "Writing domains:"
for domain in $domains; do
  echo " - $domain"
  defaults -currentHost write -g $domain -array '<dict><key>HIDKeyboardModifierMappingDst</key><integer>-1</integer><key>HIDKeyboardModifierMappingSrc</key><integer>0</integer></dict>'
done

echo ""
echo "Done. You should restart your machine now for the changes to take effect."

