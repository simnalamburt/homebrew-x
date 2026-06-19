class Gitstatus < Formula
  desc "Status daemon used by shell prompts"
  homepage "https://github.com/simnalamburt/gitstatus"
  url "https://github.com/simnalamburt/gitstatus/archive/46f8d809ec9873f4c0fe56f699a730d5a9863ef6.tar.gz"
  version "1.5.5+simnalamburt.11.g46f8d80"
  sha256 "8947c108c8e6d6be0c9a23bf951d25b80a8bbafcf3231c36b1a284e415982b53"
  license "GPL-3.0-or-later"
  head "https://github.com/simnalamburt/gitstatus.git", branch: "master"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/gitstatus-1.5.5+simnalamburt.11.g46f8d80"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "2ef0af5aa7f884fd9cf666c3003b7aff3564d1b179058eba0fd844a0c11b6aa3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ba8f5683b0d769576e9a3c0024bad13d67a96352ea60ca955b0a521c99b9da96"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "14d8ecfd1b726ba9785efb4149d70532ff24d705a9bc08a16da61b14fcf5192d"
    sha256 cellar: :any,                 arm64_linux:   "19d70dd8a5b0ce1e73980d3bbfacda70d609222fb54c55b92b8b5a9da81fecc4"
    sha256 cellar: :any,                 x86_64_linux:  "fa11a0f83be168756f9deab68177a8dde7b1cf45874e6f270c242bffff8dae34"
  end

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
