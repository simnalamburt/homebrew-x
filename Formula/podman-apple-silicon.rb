class PodmanAppleSilicon < Formula
  desc "Tool for managing OCI containers and pods"
  homepage "https://podman.io/"
  url "https://github.com/simnalamburt/podman.git", using: :git, revision: "c609ca200041231348a2f5958b59bc3bcd7280ff"
  version "3.3.1-patched.0"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/podman-apple-silicon-3.3.1-patched.0"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "7026a25254469ccd174f6f1eb4a93b81e3b1f4653b39801b97f0247eb0bfdc1b"
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
    on_macos do
      bin.install "bin/#{os}/podman" => "podman-remote"
      bin.install_symlink bin/"podman-remote" => "podman"
    end
    on_linux do
      bin.install "bin/podman-remote"
    end

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