class Memobar < Formula
  desc "CLI tool for memoBar"
  homepage "https://memobar.app"
  url "https://github.com/code-bio/homebrew-memobar/releases/download/v0.2.1/memobar-cli-0.2.1.tar.gz"
  sha256 "447eed250c2c43df913e1d5c3269fb116b1b6afaea67d045e9f4e3f5a60c99a8"
  license "Copyright 2025 Christian Franzl, code.bio GmbH"

  depends_on :macos

  def install
    # Install binary and frameworks together in libexec (preserves original rpath)
    libexec.install "memobar"
    (libexec/"Frameworks").install Dir["Frameworks/*"]

    # Symlink to bin - no signature modification needed
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
    # Test that version command runs without error
    assert_match(/memobar|version/i, shell_output("#{bin}/memobar version", 0))
  end
end
