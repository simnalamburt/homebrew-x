class Bunv < Formula
  desc "Corepack for Bun. PoC for implementing version management inside bun itself"
  homepage "https://github.com/aklinker1/bunv"
  url "https://github.com/aklinker1/bunv/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "f903566fede4eacf0f0a602dc87fa7327d056e3fe54a086e6906bf038640d668"
  license "MIT"
  head "https://github.com/aklinker1/bunv.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/bunv-0.5.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "a835864e5ff8012b691fef23da8f402ada6b5c97921b7bfc98ad1d93dcea99cf"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cbd9f04985d770b1c2c75e4239ec037e9081197af0c529ca2e3bba8dc4ba3bc4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "3053dec24df2967971405622c9035be2bb87066eddbc2400879661c49f2d22b5"
    sha256 cellar: :any_skip_relocation, ventura:       "ddc69406bd1b1c459e94bf15da5d8848317f91093988b837ccd48fc84f06a18e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5701c76de70fa638767040a369e012eb0e6daedf4a59cf47cd216e6cd442a8a7"
  end

  depends_on "zig@0.14" => :build

  conflicts_with "oven-sh/bun/bun", because: "both install `bun` binaries"

  def install
    system "zig", "build", *std_zig_args
  end
end
