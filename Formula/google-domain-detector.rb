class GoogleDomainDetector < Formula
  desc "Detect which domains run Google Workspace or Google Cloud, from public DNS alone"
  homepage "https://github.com/LarsArtmann/google-domain-detector"
  url "https://github.com/LarsArtmann/google-domain-detector/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "994fc81b108c685910a86bc89c8998b8595a9bcd18ad45063d1bb1aa4cab2891"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/google-domain-detector"
  end

  test do
    assert_match "google-domain-detector", shell_output("#{bin}/google-domain-detector version")
    assert_match "scan", shell_output("#{bin}/google-domain-detector --help")
  end
end
