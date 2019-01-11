FROM ubuntu:xenial
LABEL maintainer "quaan82@gmail.com"
EXPOSE 6080 5900 6099
ENV \
  DEBIAN_FRONTEND="nonintractive" \
  VNC_PASSWORD="password" \
  DISPLAY=":99"
RUN apt-get update -y
RUN apt-get install -y xvfb x11vnc fluxbox net-tools git curl tar bzip2 software-properties-common
RUN apt-get install -y python3 python3-pip && ln -s /usr/bin/python3 /usr/bin/python
RUN apt-get install -y libgtk2.0-0 libglu1-mesa libsdl-image1.2 libsdl-sound1.2 libsdl-ttf2.0-0 libopenal1
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
  apt-get update && \
  apt-get install -y gcc-4.9 && \
  apt-get upgrade -y libstdc++6

RUN pip3 install --no-cache-dir numpy
RUN git clone https://github.com/novnc/noVNC.git /usr/src/app/noVNC && \
  git clone https://github.com/kanaka/websockify /usr/src/app/noVNC/utils/websockify && \
  cp /usr/src/app/noVNC/vnc.html /usr/src/app/noVNC/index.html

ENV DF http://www.bay12games.com/dwarves/df_44_12_linux.tar.bz2
ENV DFHACK https://github.com/DFHack/dfhack/releases/download/0.44.12-r2/dfhack-0.44.12-r2-Linux-64-gcc-7.tar.bz2
  
RUN curl -ssL $DF | tar -xj
RUN curl -ssL $DFHACK | tar -xj -C /df_linux && cp /df_linux/dfhack.init-example /df_linux/dfhack.init

RUN sed -i 's/SOUND:YES/SOUND:NO/' /df_linux/data/init/init.txt
RUN sed -i 's/INTRO:YES/INTRO:NO/' /df_linux/data/init/init.txt
RUN sed -i 's/WINDOWEDX:80/WINDOWEDX:1024/' /df_linux/data/init/init.txt
RUN sed -i 's/WINDOWEDY:25/WINDOWEDY:740/' /df_linux/data/init/init.txt
RUN sed -i 's/FONT:curses_640x300.png/FONT:curses_800x600.png/' /df_linux/data/init/init.txt
RUN sed -i 's/FPS_CAP:100/FPS_CAP:120/' /df_linux/data/init/init.txt
RUN sed -i 's/G_FPS_CAP:50/G_FPS_CAP:60/' /df_linux/data/init/init.txt
  
COPY ./entrypoint.sh /opt/entrypoint.sh
COPY ./fluxbox /root/.fluxbox
ENTRYPOINT /opt/entrypoint.sh
