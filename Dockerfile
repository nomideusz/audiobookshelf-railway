FROM ghcr.io/advplyr/audiobookshelf:2.36.0

# Railway allows one volume per service — mount it at /data and point
# Audiobookshelf's config (SQLite DB) and metadata there, with the media
# library alongside so uploads persist too.
ENV CONFIG_PATH=/data/config \
    METADATA_PATH=/data/metadata

COPY railway-entrypoint.sh /railway-entrypoint.sh
RUN chmod +x /railway-entrypoint.sh

ENTRYPOINT ["tini", "--", "/railway-entrypoint.sh"]
