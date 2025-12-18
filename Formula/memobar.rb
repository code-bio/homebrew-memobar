class Memobar < Formula
  desc "CLI tool for memoBar"
  homepage "https://memobar.app"
  url "https://github.com/code-bio/homebrew-memobar/releases/download/v0.2.2/memobar-cli-0.2.2.tar.gz"
  sha256 "c7c0962f9b5a12ca9ab0b7f95d24a9f7360c4b78e157b1a682fc247df69c3198"
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
