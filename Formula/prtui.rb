class Prtui < Formula
  desc "Terminal UI for reviewing GitHub pull requests"
  homepage "https://github.com/tale/prtui"
  license "MIT"

  # prtui is private, so there is no release asset a formula can fetch: the
  # browser download URL 404s without credentials. Cloning over SSH uses the
  # key git already has, which keeps the tap itself free of tokens.
  head "ssh://git@github.com/tale/prtui.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Pull request number", shell_output("#{bin}/prtui --help")
  end
end
