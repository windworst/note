### Markdown 转 html

```shell
docker run --rm -it -v "${PWD}:/workdir" -w /workdir docker.io/pandoc/core:3.5.0.0-alpine README.md -o index.html
```

compose.yml
```yaml
services:
  make-html:
    image: docker.io/pandoc/core:3.5.0.0-alpine
    command: README.md -o index.html
    working_dir: ${PATH_PREFIX:-}${PWD:-/workdir}
    volumes:
      - .:${PATH_PREFIX:-}${PWD:-/workdir}
```