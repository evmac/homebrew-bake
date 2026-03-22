# typed: false
# frozen_string_literal: true
#
# Source of truth for evmac/homebrew-bake Formula/bake.rb.
# The release workflow copies this file and substitutes TAG and SHA256.

class Bake < Formula
  desc "Minimal Make replacement: one binary, one Bakefile, explicit DAG, typed args"
  homepage "https://github.com/evmac/go-bake"
  url "https://github.com/evmac/go-bake/archive/refs/tags/v1.7.2.tar.gz"
  sha256 "ff1439740bb56ba13452a4a14cf86891732b9a883002b2a9f147fabdf0153f25"
  license "MIT"
  head "https://github.com/evmac/go-bake.git", branch: "trunk"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.Version=v#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/bake"
  end

  test do
    (testpath/"Bakefile").write <<~BAKE
      target build { steps { exec ["true"] } }
    BAKE
    assert_match "build", shell_output("#{bin}/bake --list")
  end
end
