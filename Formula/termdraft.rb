class Termdraft < Formula
  desc "Local-first Markdown editor for the terminal"
  homepage "https://github.com/Betancourt1/TermDraft"
  url "https://github.com/Betancourt1/TermDraft/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "7078cb44d96caa14df7aa6435c3f0fdf4e906f5d2fad1a135bc2e357380c52ff"
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
