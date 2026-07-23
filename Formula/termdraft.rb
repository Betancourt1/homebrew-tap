class Termdraft < Formula
  desc "Local-first Markdown editor for the terminal"
  homepage "https://github.com/Betancourt1/TermDraft"
  url "https://github.com/Betancourt1/TermDraft/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "302ddc3dae2b51536b22b25e7b9101e9c74c61e68b28f9f3267e6834bd84b011"
  license "MIT"
  version_scheme 1

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "termdraft #{version}", shell_output("#{bin}/termdraft --version")
    assert_match "A local-first Markdown editor for the terminal", shell_output("#{bin}/termdraft --help")
    assert_match testpath.to_s, shell_output("#{bin}/termdraft --inspect #{testpath}")
  end
end
