class Gitstatus < Formula
  desc "Status daemon used by shell prompts"
  homepage "https://github.com/simnalamburt/gitstatus"
  url "https://github.com/simnalamburt/gitstatus/archive/2f6cb0e7e01c01bf564fe51c1c6c0316ec407f5f.tar.gz"
  version "1.5.5+simnalamburt.10.g2f6cb0e"
  sha256 "69202e26272262a04e586636bbf6fe15da5c43aad2af8b0edb70aaaabbb5fcf9"
  license "GPL-3.0-or-later"
  head "https://github.com/simnalamburt/gitstatus.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "libiconv" => :build if OS.mac?

  uses_from_macos "zlib"

  resource "libgit2" do
    url "https://github.com/libgit2/libgit2/archive/44c05e5d12f2b8b86b9730bb50f27daf74143782.tar.gz"
    sha256 "5217ab829229b8435970a76a41e17ba5538926d7cd6cb95a948e761dea72e3c0"
  end

  def install
    if OS.mac?
      inreplace "build",
                'brew_prefix="$(command brew --prefix)"',
                "brew_prefix=\"#{HOMEBREW_PREFIX}\""
    end

    if OS.linux?
      # glibc static PIE can crash in Homebrew's Linux sandbox during the
      # build script's smoke test; keep Homebrew's system runtime dynamic.
      inreplace "build" do |s|
        s.sub!(
          "  linux)\n    gitstatus_ldflags=\"$gitstatus_ldflags ${static_pie:--static}\"",
          "  linux)\n    gitstatus_ldflags=\"$gitstatus_ldflags\"",
        )
      end
    end

    (buildpath/"deps").mkpath
    cp resource("libgit2").cached_download,
       buildpath/"deps/libgit2-44c05e5d12f2b8b86b9730bb50f27daf74143782.tar.gz"

    system "./build"

    bin.install "usrbin/gitstatusd"
    pkgshare.install "gitstatus.plugin.sh", "gitstatus.plugin.zsh"
    pkgshare.install "gitstatus.prompt.sh", "gitstatus.prompt.zsh"
  end

  def caveats
    <<~EOS
      Add this to your shell startup file, such as ~/.zshrc or ~/.bashrc:

        export GITSTATUS_DAEMON=#{HOMEBREW_PREFIX}/bin/gitstatusd
    EOS
  end

  test do
    assert_match version.to_s.split("+").first, shell_output("#{bin}/gitstatusd --version")

    system "git", "init", "--initial-branch=main", testpath/"repo"
    system "git", "-C", testpath/"repo", "config", "user.name", "Your Name"
    system "git", "-C", testpath/"repo", "config", "user.email", "you@example.com"
    system "git", "-C", testpath/"repo", "commit", "--allow-empty",
           "--allow-empty-message", "--no-gpg-sign", "-m", ""

    response = pipe_output(bin/"gitstatusd", "hello\037#{testpath}/repo\036")
    assert_match "hello", response
    assert_match "#{testpath}/repo", response
    assert_match "main", response
  end
end
