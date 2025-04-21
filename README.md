My macOS packages
========

### [ferron](https://github.com/ferronweb/ferron)
A fast, memory-safe web server written in Rust.
```bash
brew install simnalamburt/x/ferron
```

### [cargo-criterion](https://github.com/bheisler/cargo-criterion)
cargo-criterion is a Plugin for Cargo which handles much of the heavy lifting
for analyzing and reporting on [criterion-rs] benchmarks.
```bash
brew install simnalamburt/x/cargo-criterion
```

[criterion-rs]: https://github.com/bheisler/criterion.rs

### [cargo-shear](https://github.com/Boshen/cargo-shear)
Detect and remove unused dependencies from `Cargo.toml` in Rust projects.
```bash
brew install simnalamburt/x/cargo-shear
```

### [bunv](https://github.com/aklinker1/bunv)
Corepack for Bun. PoC for implementing version management inside bun itself.
```bash
brew install simnalamburt/x/bunv
```

### [input-source](https://github.com/simnalamburt/macos-input-source)
Tiny input source manager for macOS.
```bash
brew install simnalamburt/x/input-source
```

### [jaso](https://github.com/cr0sh/jaso)
Normalizes filenames to Unicode NFC and is faster than convmv(1).
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
A simple TOTP CLI powered by keychain of macOS.
```bash
brew install simnalamburt/x/totp
```

&nbsp;

Archives
--------
These packages have outlived their usefulness, but have been preserved for historical reasons.

### [ra-multiplex](https://github.com/pr2502/ra-multiplex)
Allows sharing a single rust-analyzer server instance among multiple LSP clients to save resources.

This formula has been deprecated since [ra-multiplex has been migrated to homebrew-core][core#210511].

[core#210511]: https://github.com/Homebrew/homebrew-core/pull/210511

```bash
# Deprecated
brew install simnalamburt/x/ra-multiplex
brew services start simnalamburt/x/ra-multiplex

# Use homebrew/core version instead
brew install ra-multiplex
brew services start ra-multiplex
```

### haskell-stack
haskell-stack patched to work with Apple Silicon. See [Homebrew/homebrew-core#95032](https://github.com/Homebrew/homebrew-core/pull/95032) and [commercialhaskell/stack#5677](https://github.com/commercialhaskell/stack/pull/5677) for the upstream PRs.

This formula has been deprecated since the official version of haskell-stack now supports Apple Silicon.

```bash
# Deprecated
brew install simnalamburt/x/haskell-stack

# Use homebrew/core version instead
brew install haskell-stack
```

### podman-apple-silicon
Podman v3.3.1, patched to work with Apple Silicon. See [simnalamburt/podman](https://github.com/simnalamburt/podman) for the source codes.

This fork is now deprecated, as the official version of Podman has supported Apple Silicon since v3.4.0.

```bash
# Deprecated
brew install simnalamburt/x/podman-apple-silicon

# Use homebrew-core version instead
brew install podman
```

### qemu-hvf
QEMU v6.1.0 with [Hypervisor.framework](https://developer.apple.com/documentation/hypervisor) patch applied. See [simnalamburt/qemu@hvf](https://github.com/simnalamburt/qemu/tree/hvf) for the patch that is used.

This fork is now deprecated, as the official version of QEMU has added 'hvf' accelerator support for AArch64 guests on Apple Silicon hosts since v6.2.0.

```bash
# Deprecated
brew install simnalamburt/x/qemu-hvf

# Use homebrew-core version instead
brew install qemu
```

&nbsp;

--------
*homebrew-x* is primarily distributed under the terms of both the [MIT license]
and the [Apache License (Version 2.0)]. See [COPYRIGHT] for details.

[MIT license]: LICENSE-MIT
[Apache License (Version 2.0)]: LICENSE-APACHE
[COPYRIGHT]: COPYRIGHT
