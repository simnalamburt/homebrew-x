My macOS packages
========
### haskell-stack
haskell-stack patched to work with Apple Silicon. See [Homebrew/homebrew-core#95032](https://github.com/Homebrew/homebrew-core/pull/95032) for the upstream PR.
```bash
brew install simnalamburt/x/haskell-stack
```

### totp
Simple TOTP CLI, powered by keychain of macOS. See [simnalamburt/macos-totp-cli](https://github.com/simnalamburt/macos-totp-cli) for the further details.
```bash
brew install simnalamburt/x/totp
```

&nbsp;

Archives
--------
These packages have outlived their usefulness, but have been preserved for historical reasons.

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

&nbsp;

--------
*homebrew-x* is primarily distributed under the terms of both the [MIT license]
and the [Apache License (Version 2.0)]. See [COPYRIGHT] for details.

[MIT license]: LICENSE-MIT
[Apache License (Version 2.0)]: LICENSE-APACHE
[COPYRIGHT]: COPYRIGHT
