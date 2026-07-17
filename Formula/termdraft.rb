class Termdraft < Formula
  desc "Local-first Markdown editor for the terminal"
  homepage "https://github.com/Betancourt1/TermDraft"
  url "https://github.com/Betancourt1/TermDraft/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "4b8b35ce2051e96a8cb68b6ee84f48145d7df3fc5b5e25076faca3a1f63186d0"
  license "MIT"

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
