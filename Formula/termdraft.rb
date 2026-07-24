class Termdraft < Formula
  desc "Local-first Markdown editor for the terminal"
  homepage "https://github.com/Betancourt1/TermDraft"
  url "https://github.com/Betancourt1/TermDraft/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "35895dce7b24583d5cc64df36bd37670a38d0825e6ed742286d33c6764b39241"
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
