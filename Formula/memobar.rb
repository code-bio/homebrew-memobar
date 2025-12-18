class Memobar < Formula
  desc "CLI tool for memoBar - display messages in macOS menu bar"
  homepage "https://memobar.app"
  url "https://github.com/code-bio/homebrew-memobar/releases/download/v0.2.1/memobar-cli-0.2.1.tar.gz"
  sha256 "447eed250c2c43df913e1d5c3269fb116b1b6afaea67d045e9f4e3f5a60c99a8"
  license "MIT"

  depends_on :macos

  def install
    # Install CLI binary to bin
    bin.install "memobar"

    # Install frameworks to libexec/Frameworks
    (libexec/"Frameworks").install Dir["Frameworks/*"]

    # Update binary rpath to find frameworks in libexec
    system "install_name_tool", "-delete_rpath", "@executable_path/Frameworks", bin/"memobar"
    system "install_name_tool", "-add_rpath", "#{libexec}/Frameworks", bin/"memobar"
  end

  def caveats
    <<~EOS
      The memobar CLI requires the memoBar app to be running.
      Get the app from: https://memobar.app

      Usage:
        memobar set "Your message"       # Set message in default channel
        memobar get                      # Get current message
        memobar list                     # List all messages
        memobar --help                   # Show all commands
    EOS
  end

  test do
    # Test that version command runs without error
    assert_match(/memobar|version/i, shell_output("#{bin}/memobar version", 0))
  end
end
