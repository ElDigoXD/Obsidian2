# Test
laptop
desktop
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

```sh
#!/bin/bash

yum install tar gzip zip bsdtar wget


mkdir bin
curl -sSL https://github.com/rust-lang/mdBook/releases/download/v0.4.35/mdbook-v0.4.35-x86_64-unknown-linux-gnu.tar.gz | tar -xz --directory=bin
curl -sSL https://github.com/badboy/mdbook-toc/releases/download/0.14.1/mdbook-toc-0.14.1-x86_64-unknown-linux-gnu.tar.gz | tar -xz --directory=bin
curl -sSL https://github.com/lzanini/mdbook-katex/releases/download/v0.5.8pub/mdbook-katex-v0.5.8-x86_64-unknown-linux-gnu.tar.gz | tar -xz --directory=bin
curl -sSL https://github.com/ang-zeyu/infisearch/releases/download/v0.10.1/indexer.x86_64-unknown-linux-gnu.zip | bsdtar -xf - --directory=bin md*

wget https://github.com/ElDigoXD/bd2/releases/download/deploy/mdbook-pandoc.zip
bsdtar -xf mdbook-pandoc.zip --directory=bin
chmod +x bin/*

bin/mdbook build
```
