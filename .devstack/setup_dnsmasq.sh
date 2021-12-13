#!/bin/bash

if [ -f "/usr/local/etc/dnsmasq.conf" ]; then
    echo "It seems that dnsmasq is already installed on your machine"
    echo "Please add the address=/dev.local/127.0.0.1 in the dnsmasq.conf"
    exit 0 
fi

echo "Installing dnsmasq through brew...."
sleep 5

brew install dnsmasq

echo "We well configure dnsmasq, please accept warning!"
sleep 5

mkdir -p /usr/local/etc/
cp $(brew list dnsmasq | grep /dnsmasq.conf.example$) /usr/local/etc/dnsmasq.conf
sudo cp $(brew list dnsmasq | grep /homebrew.mxcl.dnsmasq.plist$) /Library/LaunchDaemons/
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
sed -i '' 's+#address=/double-click.net/127.0.0.1+address=/dev.local/127.0.0.1+g' /usr/local/etc/dnsmasq.conf

echo "Restarting...."

sudo launchctl stop homebrew.mxcl.dnsmasq
sudo launchctl start homebrew.mxcl.dnsmasq

echo "Checking install through dig"

dig test.dev.local @127.0.0.1 | grep -C1 "ANSWER SECTION"

echo "Linking dnsmasq server to the system"

sudo mkdir -p /etc/resolver

sudo tee /etc/resolver/dev.local >/dev/null <<EOF
nameserver 127.0.0.1
EOF