FROM clamav/clamav:0.104_base
ARG TYPE

COPY $TYPE.conf /etc/clamav/clamd.conf
# Disables freshclam from running and updating.
# ENV CLAMAV_NO_FRESHCLAMD=true
