#!/usr/bin/env bash
cd /usr/local
wget -O go.tar.gz https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz
tar -zxf go.tar.gz
rm go.tar.gz

OLDPATH="$PATH"
PATH="$PATH:/usr/local/go/bin"

go get -u -v github.com/FsHtroy/shadowsocks-multiuser
cd ~/go/src/github.com/FsHtroy/shadowsocks-multiuser

go build -ldflags "-w -s"

mkdir -p /usr/local/shadowsocks-multiuser
cp shadowsocks-multiuser /usr/local/shadowsocks-multiuser
chmod +x /usr/local/shadowsocks-multiuser/shadowsocks-multiuser
/bin/cp -rf scripts/systemd/shadowsocks-multiuser.service /usr/lib/systemd/system
systemctl daemon-reload

rm -rf ~/go

PATH="$OLDPATH"
cd /usr/local
rm -rf go

exit 0
