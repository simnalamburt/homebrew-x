class Ferron < Formula
  desc "Fast, memory-safe web server written in Rust"
  homepage "https://www.ferronweb.org/"
  url "https://github.com/ferronweb/ferron/archive/refs/tags/1.0.0.tar.gz"
  sha256 "172e7b23e5032a7caa88a86777509dd5fda9d354294b162bdefc5988b1b09fc5"
  license "MIT"
  head "https://github.com/ferronweb/ferron.git", branch: "develop"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/ferron-1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9536c72c4127d8567d379e7e62623a08e71dfdc04cb2dd203d6a3be821b54be3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "563792750db9e9dd97c16d8929e9326d230e7ee6a58f79c02aa7482869240542"
    sha256 cellar: :any_skip_relocation, ventura:       "5c0d1eb22c69bee5ab4eeb498f9266747d61e53ac9dfb65deba12082470531f6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5f2532316affa2b11909855520bb46cfb4113ee920fec559c1ac6574fbe0db48"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "ferron")
  end

  test do
    port = free_port

    (testpath/"ferron.yaml").write "global: {\"port\":#{port}}"
    expected_output = <<~OUTPUT.chomp
      <!DOCTYPE html>
      <html lang="en">
      <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>404 Not Found</title>
      </head>
      <body>
          <h1>404 Not Found</h1>
          <p>The requested resource wasn't found. Double-check the URL if entered manually.</p>
      </body>
      </html>
    OUTPUT

    begin
      pid = spawn bin/"ferron", "-c", testpath/"ferron.yaml"
      assert_match expected_output, shell_output("curl -s 127.0.0.1:#{port}")
    ensure
      Process.kill("TERM", pid)
      Process.wait(pid)
    end
  end
end
