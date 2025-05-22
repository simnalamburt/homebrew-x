class ElbLogParser < Formula
  desc "Simple AWS ELB log parser which parses Classic LB and ALB logs into JSONs"
  homepage "https://github.com/simnalamburt/elb-log-parser"
  url "https://github.com/simnalamburt/elb-log-parser/archive/refs/tags/v0.2.7.tar.gz"
  sha256 "02d6ae02f606688b20326ef3b0bb2edafc589dc177871c973af22934b764eaca"
  license "AGPL-3.0-or-later"
  head "https://github.com/simnalamburt/elb-log-parser.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/elb-log-parser-0.2.7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "53d4d45143d587f8de57e145e94aeb948fa4a340b207ae88079cb548534e4ddc"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "af0342a792778be931436619f37ae575c50fa4e4cee9db9fc43d44722e269d55"
    sha256 cellar: :any_skip_relocation, ventura:       "a793fea0cb25d9009a63cba2eed10d0715aac20dfa36c1c6ecaf8475c05ecfa8"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "39f8a1b7904aeeadf1053759cd53a4aa6a21fecd15097cf4cd3570e0c8d7c0ca"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"elb-log-parser", "completion")
  end
end
