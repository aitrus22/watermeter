# Thin Home Assistant Add-on wrapper around the upstream nohn/watermeter image.
# Persists configuration in the Supervisor's per-addon /data volume instead of
# the image's default internal path, so settings survive addon restarts/updates.
FROM nohn/watermeter:1.4.1

RUN rm -rf /usr/src/watermeter/src/config \
    && ln -s /data /usr/src/watermeter/src/config
