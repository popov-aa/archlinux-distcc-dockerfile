FROM archlinux:latest

RUN pacman -Sy --noconfirm
RUN pacman -S --noconfirm gcc distcc

ENV HOME /home/distcc
ENV JOBS 4

ENTRYPOINT distccd \
  --daemon \
  --no-detach \
  --user distcc \
  --port 3632 \
  --stats \
  --stats-port 3633 \
  --log-stderr \
  --listen 0.0.0.0 \
  --jobs ${JOBS} \
  --nice ${JOBS} \
  --allow 0.0.0.0/0

EXPOSE \
  3632/tcp \
  3633/tcp
