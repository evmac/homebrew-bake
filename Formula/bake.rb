# typed: false
# frozen_string_literal: true

class Bake < Formula
  desc "Bake your tools into your project."
  homepage "https://github.com/em/go-bake"
  url "https://github.com/em/go-bake/archive/refs/tags/v0.0.0.tar.gz"
  sha256 "" # run: curl -sL <url> | shasum -a 256
  license "MIT"
  head "https://github.com/em/go-bake.git", branch: "main"

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
