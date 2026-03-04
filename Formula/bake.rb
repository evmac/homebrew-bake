# typed: false
# frozen_string_literal: true

class Bake < Formula
  desc "Minimal Make replacement: one binary, one Bakefile, explicit DAG, typed args"
  homepage "https://github.com/evmac/go-bake"
  url "https://github.com/evmac/go-bake/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "826a5d06b74ce4457c6d70cf340414f9b20c143731e6c6be523761a0642f7131"
  license "MIT"
  head "https://github.com/evmac/go-bake.git", branch: "trunk"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/bake"
  end

  test do
    (testpath/"Bakefile").write <<~BAKE
      target build { steps { exec ["true"] } }
    BAKE
    assert_match "build", shell_output("#{bin}/bake --list")
  end
end
