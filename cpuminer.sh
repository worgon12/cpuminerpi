#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;33m'
NC='\033[0m'
echo "${BLUE}############################################${NC}"
echo "${GREEN}#   Worgon12 Raspberry CPUminer Compiler  #${NC}"
echo "${BLUE}############################################${NC}"
sleep 4
echo "${RED}First of all we will install the dependencies${NC}"
echo "${RED}Starting installing the dependencies, please do not close the window${NC}"
sleep 5
cd ~/cpuminer-opt/make clean
sudo rm -fr ~/cpuminer-multi
sudo rm -fr ~/cpuminer-opt
sudo apt install automake git screen autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make -y
git clone https://github.com/tpruvot/cpuminer-multi.git
#git clone https://github.com/glukolog/cpuminer-opt.git
cd ~/cpuminer-multi
#cd ~/cpuminer-opt
echo "${GREEN}done${NC}"
sleep 3
echo "${BLUE}Starting Compile${NC}"
sleep 3
./autogen.sh
./configure CFLAGS="-O3 -march=armv8-a+crypto -mtune=cortex-a53" --with-curl --with-crypto
make -j4
echo "${GREEN}done${NC}"
sleep 3
echo "${BLUE}start the CPUminer with...${NC}"
echo "${BLUE}./cpuminer -a yescryptR16 -o stratum+tcp://.... -u wallet -p pass${NC}"
sleep 10
exit

