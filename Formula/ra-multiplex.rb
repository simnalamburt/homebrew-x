class RaMultiplex < Formula
  desc "Share one rust-analyzer instance between multiple LSP clients to save resources"
  homepage "https://github.com/pr2502/ra-multiplex"
  url "https://github.com/pr2502/ra-multiplex/archive/refs/tags/v0.2.5.tar.gz"
  sha256 "c24a7e277adce9bbfb86641905d75f166e46459cf4e5b5f3aaa7456b052392dc"
  license "MIT"
  head "https://github.com/pr2502/ra-multiplex.git", branch: "main"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/ra-multiplex-0.2.5"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c9eb188529fd716e91689ca96de34f0940cfe3b19f7fd249f1c55175c9953d43"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "9ad5f9ca6b8a201b2fc0b05dfb93682763f569239aad11593956c5c9d7ced8d9"
    sha256 cellar: :any_skip_relocation, ventura:       "7fcee4ebd0c5d4bb6c71dfa8269b72ccf95cbc2a9612071b6d45e2c61e7b8d36"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8c52e9bcda7b35d91976d2bb4e8b0fe8ecc7273a704930bac4de3a22b90b3824"
  end

  deprecate! date: "2025-03-21", because: "is now in homebrew/core", replacement: "ra-multiplex"

  # They're optional dependencies since many users use rustup.
  depends_on "rust" => [:build, :optional]
  depends_on "rust-analyzer" => :optional

  def install
    system "cargo", "install", *std_cargo_args
  end

  service do
    run [opt_bin/"ra-multiplex", "server"]
    keep_alive true
    error_log_path var/"log/ra-multiplex.log"
    log_path var/"log/ra-multiplex.log"

    # Need cargo and rust-analyzer in PATH
    environment_variables PATH: "#{std_service_path_env}:#{Dir.home}/.cargo/bin"
  end

  def rpc(json)
    "Content-Length: #{json.size}\r\n" \
      "\r\n" \
      "#{json}"
  end

  test do
    input = rpc <<~JSON
      {
        "jsonrpc":"2.0",
        "id":1,
        "method":"initialize",
        "params": {
          "rootUri": null,
          "initializationOptions": {},
          "capabilities": {}
        }
      }
    JSON

    input += rpc <<~JSON
      {
        "jsonrpc":"2.0",
        "method":"initialized",
        "params": {}
      }
    JSON

    input += rpc <<~JSON
      {
        "jsonrpc":"2.0",
        "id": 2,
        "method":"shutdown",
        "params": null
      }
    JSON

    input += rpc <<~JSON
      {
        "jsonrpc":"2.0",
        "method":"exit",
        "params": {}
      }
    JSON

    output = /Content-Length: \d+\r\n\r\n/

    begin
      pid = spawn bin/"ra-multiplex", "server"
      assert_match output, pipe_output(bin/"ra-multiplex", input, 0)
    ensure
      Process.kill("TERM", pid)
      Process.wait(pid)
    end
  end
end
