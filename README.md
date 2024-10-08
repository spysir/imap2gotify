# A missing link between IMAP and [Gotify](https://gotify.net)

[![](https://images.microbadger.com/badges/version/cyrinux/imap2gotify.svg)](https://microbadger.com/images/cyrinux/imap2gotify)
[![ci](https://github.com/cyrinux/imap2gotify/actions/workflows/ci.yml/badge.svg)](https://github.com/cyrinux/imap2gotify/actions/workflows/ci.yml)

Get push notification via Gotify about new emails (using IMAP IDLE)

## Run

```
docker run -ti -v "$(pwd)/config:/app/config" cyrinux/imap2gotify:latest
```

or

```bash
docker-compose up -d --build
```

or

## Build

```bash
docker build -t cyrinux/imap2gotify .
```
## docker-compose
```
services:
  imap2gotify:
    image: cyrinux/imap2gotify:latest
    container_name: imap2gotify
    restart: always
    volumes:
      - ./config:/app/config
    environment:
      - TZ=Asia/Shanghai
```
## Configuration

- Check `settings.toml.example` example in `config` directory.

- If no `priority` setting is specified for a rule, priority will be based on the
  "importance" mail header, mapping as follows:

  - High -> priority 7
  - Medium -> priority 4
  - Low -> priority 3
  - priority 1 for all others

- "extras" parameters can be found [here](https://gotify.net/docs/msgextras)
