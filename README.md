My macOS packages
========
### [ra-multiplex](https://github.com/pr2502/ra-multiplex)
Share one rust-analyzer server instance between multiple LSP clients to save resources.
```bash
brew install simnalamburt/x/ra-multiplex
```

### [jaso](https://github.com/cr0sh/jaso)
Normalizes filenames to Unicode NFC, faster than convmv(1).
```bash
brew install simnalamburt/x/jaso
```

### [uniqs](https://github.com/simnalamburt/uniqs)
uniq(1) alternative with streaming support.
```bash
brew install simnalamburt/x/uniqs
```

### [elb-log-parser](https://github.com/simnalamburt/elb-log-parser)
Simple AWS ELB log parser which parses Classic LB and ALB logs into JSONs.
```bash
brew install simnalamburt/x/elb-log-parser
```

### [totp](https://github.com/simnalamburt/macos-totp-cli)
Simple TOTP CLI, powered by keychain of macOS.
```bash
brew install simnalamburt/x/totp
```

&nbsp;

Archives
--------
<details>
<summary>
These packages have outlived their usefulness, but have been preserved for historical reasons.
</summary>

### haskell-stack
haskell-stack patched to work with Apple Silicon. See [Homebrew/homebrew-core#95032](https://github.com/Homebrew/homebrew-core/pull/95032) and [commercialhaskell/stack#5677](https://github.com/commercialhaskell/stack/pull/5677) for the upstream PRs.
```bash
brew install simnalamburt/x/haskell-stack
```

### podman-apple-silicon
Podman patched to work with Apple Silicon. You won't need this fork since podman v3.4.0 or later works fine with Apple Silicon. See [simnalamburt/podman](https://github.com/simnalamburt/podman) for the source codes.
```bash
brew install simnalamburt/x/podman-apple-silicon

# Example
podman machine init
podman machine start
podman run -p 8080:80 docker.io/nginx
```

### qemu-hvf
qemu with [Hypervisor.framework](https://developer.apple.com/documentation/hypervisor) patch applied. See [simnalamburt/qemu@hvf](https://github.com/simnalamburt/qemu/tree/hvf) for the patch that is used. It's based on the 6.1.0 version of qemu.
```bash
brew install simnalamburt/x/qemu-hvf
```

</details>

&nbsp;

--------
*homebrew-x* is primarily distributed under the terms of both the [MIT license]
and the [Apache License (Version 2.0)]. See [COPYRIGHT] for details.

[MIT license]: LICENSE-MIT
[Apache License (Version 2.0)]: LICENSE-APACHE
[COPYRIGHT]: COPYRIGHT
