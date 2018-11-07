#!/bin/sh
set -ex

#sudo apt update
#sudo apt install libdevel-checklib-perl
cpanm Devel::CheckLib

cd /tmp
wget -O zonemaster-ldns.zip https://github.com/zonemaster/zonemaster-ldns/archive/develop.zip
unzip zonemaster-ldns.zip
cd zonemaster-ldns-develop
perl Makefile.PL
make
sudo make install
perl -MZonemaster::Engine -E 'say $Zonemaster::LDNS::VERSION'

cd /tmp
wget -O zonemaster-engine https://github.com/zonemaster/zonemaster-engine/archive/develop.zip
unzip zonemaster-engine.zip
cd zonemaster-engine-develop
perl Makefile.PL
make
sudo make install
perl -MZonemaster::Engine -E 'say $Zonemaster::Engine::VERSION'
