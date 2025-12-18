class Memobar < Formula
  desc "CLI tool for memoBar"
  homepage "https://memobar.app"
  url "https://github.com/code-bio/homebrew-memobar/releases/download/v0.2.6/memobar-cli-0.2.6.tar.gz"
  sha256 "8914d8901d4586a5441159d44593faba08e9c650c744e05e9a78eec95fdf8b9b"
  license "Copyright 2025 Christian Franzl, code.bio GmbH"

  depends_on :macos

  def install
    libexec.install "memobar"
    (libexec/"Frameworks").install Dir["Frameworks/*"]

    bin.install_symlink libexec/"memobar"
  end

  def caveats
    <<~EOS
      The memobar CLI requires the memoBar app to be running.
      Get the app from: https://memobar.app

      Usage:
        memobar version                  # Show current version
        memobar --help                   # Show all commands
    EOS
  end

  test do
    assert_match(/memobar|version/i, shell_output("#{bin}/memobar version", 0))
  end
end
