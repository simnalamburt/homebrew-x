My macOS packages
========
### 1. totp
Simple TOTP CLI, powered by keychain of macOS. See [simnalamburt/macos-totp-cli](https://github.com/simnalamburt/macos-totp-cli) for the further details.
```bash
brew install simnalamburt/x/totp
```

### 2. podman-apple-silicon
podman patched to work with Apple Silicon.
```bash
brew install simnalamburt/x/podman-apple-silicon

# Example
podman machine init
podman machine start
podman run -p 8080:80 docker.io/nginx
```
See https://github.com/simnalamburt/podman for the patch that is used. It's based on the main branch of podman

### 3. qemu-hvf
qemu with [Hypervisor.framework](https://developer.apple.com/documentation/hypervisor) patch applied.
```bash
brew install simnalamburt/x/qemu-hvf
```
See https://github.com/simnalamburt/qemu/tree/hvf for the patch that is used. It's based on the 6.1.0 version of qemu

&nbsp;

--------
*homebrew-x* is primarily distributed under the terms of both the [MIT license]
and the [Apache License (Version 2.0)]. See [COPYRIGHT] for details.

[MIT license]: LICENSE-MIT
[Apache License (Version 2.0)]: LICENSE-APACHE
[COPYRIGHT]: COPYRIGHT
