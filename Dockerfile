FROM ghcr.io/dock0/pkgforge-golang:latest
RUN pacman -S --noconfirm --needed arduino arduino-avr-core arduino-cli
RUN arduino-cli core install keyboardio:avr arduino:avr
RUN git config --global url."https://".insteadOf git://
RUN git clone https://github.com/akerl/Model01-Firmware /opt/test
RUN make -C /root/.arduino15/packages/keyboardio/hardware/avr/1.99.5/libraries/Kaleidoscope setup
RUN KALEIDOSCOPE_DIR=/root/.arduino15/packages/keyboardio/hardware/avr/1.99.5/libraries/Kaleidoscope make -C /opt/test -f Makefile.upstream
CMD /usr/bin/bash
