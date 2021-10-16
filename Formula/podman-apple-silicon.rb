# podman patched to work with Apple Silicon. Install it like this:
#
#     brew install simnalamburt/x/podman-apple-silicon
#
# You can run the linux VM for the podman container like this:
#
#     podman machine init       # Create a VM
#     podman machine start      # Start a VM
#     podman run -p 8080:80 docker.io/nginx   # Run a container
#
# It's based on my fork of development version of podman, and
# Alex Graf's Hypervisor.framework patch applied to the QEMU v6.1.0.
# See following links for the source codes of forks
#
# - https://github.com/simnalamburt/podman
# - https://github.com/simnalamburt/qemu/tree/hvf

class PodmanAppleSilicon < Formula
  desc "Tool for managing OCI containers and pods"
  homepage "https://podman.io/"
  url "https://github.com/simnalamburt/podman.git", using: :git, revision: "a68a46fed65ec66aa4478b2a620a01967ce1228b"
  version "4.0.0-dev+20210905"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/podman-apple-silicon-4.0.0-dev+20210905"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "bf3c16fef936aeda5e0dc3c0c5aecaa2243624c8244eacc6dd91e454c136fa15"
  end

  depends_on "go" => :build
  depends_on "go-md2man" => :build
  depends_on "qemu" if Hardware::CPU.intel?
  depends_on "simnalamburt/x/qemu-hvf" if Hardware::CPU.arm?

  conflicts_with "podman", because: "podman also ships a podman binary, but without apple silicon patch"

  resource "gvproxy" do
    url "https://github.com/containers/gvisor-tap-vsock/archive/v0.1.0.tar.gz"
    sha256 "e1e1bec2fc42039da1ae68d382d4560a27c04bbe2aae535837294dd6773e88e0"
  end

  def install
    os = if OS.mac?
      "darwin"
    else
      "linux"
    end

    system "make", "podman-remote-#{os}"
    if OS.mac?
      bin.install "bin/#{os}/podman" => "podman-remote"
      bin.install_symlink bin/"podman-remote" => "podman"
    end
    bin.install "bin/podman-remote" if OS.linux?

    resource("gvproxy").stage do
      system "make"
      bin.install "bin/gvproxy"
    end

    system "make", "install-podman-remote-#{os}-docs"
    man1.install Dir["docs/build/remote/#{os}/*.1"]

    bash_completion.install "completions/bash/podman"
    zsh_completion.install "completions/zsh/_podman"
    fish_completion.install "completions/fish/podman.fish"
  end

  test do
    assert_match "podman-remote version #{version}", shell_output("#{bin}/podman-remote -v")
    assert_match(/Error: Cannot connect to the Podman socket/i, shell_output("#{bin}/podman-remote info 2>&1", 125))
    if Hardware::CPU.intel?
      machineinit_output = shell_output("podman-remote machine init --image-path fake-testi123 fake-testvm 2>&1", 125)
      assert_match "Error: open fake-testi123: no such file or directory", machineinit_output
    end
  end
end
