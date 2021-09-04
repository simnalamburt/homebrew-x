My macOS packages
========
### 1. podman-apple-silicon
podman 3.3.1 patched to work with Apple Silicon
```bash
brew install simnalamburt/x/podman-apple-silicon

# Example
podman machine init
podman machine start
podman run docker.io/hello-world
```

### 2. qemu-hvf
qemu 6.1.0 with Hypervisor.framework patch applied
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
