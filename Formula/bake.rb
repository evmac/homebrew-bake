# typed: false
# frozen_string_literal: true

class Bake < Formula
  desc "Minimal Make replacement: one binary, one Bakefile, explicit DAG, typed args"
  homepage "https://github.com/evmac/go-bake"
  url "https://github.com/evmac/go-bake/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "0bae0caadf5ec0f4d4521cc628c891452d38876d875bebf543a200998d198a12"
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
