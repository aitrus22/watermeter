# Thin Home Assistant Add-on wrapper around the upstream nohn/watermeter image.
# Persists configuration in the Supervisor's per-addon /data volume instead of
# the image's default internal path, so settings survive addon restarts/updates.
FROM nohn/watermeter:latest

# Keep a copy of the upstream default config files so we can seed a fresh
# /data volume with them on first run (configure.php needs config.php and
# lastValue.txt to exist).
RUN cp -a /usr/src/watermeter/src/config /usr/src/watermeter/src/config.defaults \
    && rm -rf /usr/src/watermeter/src/config

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

WORKDIR /usr/src/watermeter/public
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["php", "-S", "0.0.0.0:3000"]
