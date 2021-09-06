My macOS packages
========
### 1. podman-apple-silicon
podman patched to work with Apple Silicon
```bash
brew install simnalamburt/x/podman-apple-silicon

# Example
podman machine init
podman machine start
podman run -p 8080:80 docker.io/nginx
```
See https://github.com/simnalamburt/podman for the patch that is used. It's based on the main branch of podman

### 2. qemu-hvf
qemu with Hypervisor.framework patch applied
```bash
brew install simnalamburt/x/qemu-hvf
```
See https://github.com/simnalamburt/qemu/tree/hvf for the patch that is used. It's based on the 6.1.0 version of qemu

### 3. multiarch support
M1 mac users usually want to build and/or run amd64 images.
For this, you need to install some more packages into the linux.
By default, the podman machine os is fedora-coreos, which uses rpm-ostree as package manager
```
podman machine ssh
[core@localhost ~]$ sudo rpm-ostree install qemu-user-static
[core@localhost ~]$ sudo systemctl reboot
```

&nbsp;

--------
*homebrew-x* is primarily distributed under the terms of both the [MIT license]
and the [Apache License (Version 2.0)]. See [COPYRIGHT] for details.

[MIT license]: LICENSE-MIT
[Apache License (Version 2.0)]: LICENSE-APACHE
[COPYRIGHT]: COPYRIGHT
