class Ampcode < Formula
  desc "CLI for Amp, the frontier coding agent"
  homepage "https://ampcode.com/"
  version "0.0.1767777287-ge26bee"

  url "https://registry.npmjs.org/@sourcegraph/amp/-/amp-#{version}.tgz"
  sha256 "fad190697bc89cf3b6beaa2bc6cebd3760f996f263fee80a4a40b5fc896e490f"
  license :cannot_represent

  livecheck do
    url "https://registry.npmjs.org/@sourcegraph/amp"
    regex(/"version":\s*"([^"]+)"/i)
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/amp --version")
  end
end
