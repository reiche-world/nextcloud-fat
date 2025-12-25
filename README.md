# Nextcloud fat

This is vanilla `nextcloud:32-fpm-alpine` with *NodeJS* (for *Recognize*) and *ffmpeg* (for thumbnail generation).
Maybe more tools in the future.

## Configuration

### Helm chart

```yaml
nextcloud:
  image:
    registry: ghcr.io
    repository: reiche-world/nextcloud-fat
    tag: "32"
```

### Recognize

- Set *nice*: `occ config:app:set recognize.nice_binary --value="/bin/nice"`
- Set *NodeJS*: `occ config:app:set recognize.node_binary --value="/usr/bin/node"` 

### Memories

- Set *exif-tool* to musl: `occ config:system:set memories.exiftool --value="/var/www/html/custom_apps/memories/bin-ext/exiftool-amd64-musl"`