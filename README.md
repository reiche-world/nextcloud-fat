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

- Set *nice* to `/bin/nice`
- Set *NodeJS* to `/usr/bin/node`