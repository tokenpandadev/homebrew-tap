cask "tokenpanda" do
  version "0.1.0"
  sha256 "2e74969f70bfe45f927098fca99e08280b3ad94ef297a22c394e7b4ba49d51c2"

  url "https://github.com/tokenpandadev/tokenpanda/releases/download/v#{version}/tokenpanda-#{version}.zip"
  name "tokenpanda"
  desc "Menu bar pace for Claude Code plan windows, and the Mac's own figures"
  homepage "https://tokenpanda.dev"

  depends_on macos: ">= :sonoma"

  app "tokenpanda.app"

  uninstall quit: "dev.tokenpanda.app"

  zap trash: [
    "~/Library/Application Support/dev.tokenpanda.app",
    "~/Library/Preferences/dev.tokenpanda.app.plist",
  ]

  caveats <<~EOS
    The app is signed ad hoc, not notarised. On first launch macOS blocks it:
    open System Settings, Privacy & Security, and click Open Anyway.

    Before you uninstall, open tokenpanda's Settings tab and click
    "Remove the status line entry", so ~/.claude/settings.json gets its
    previous statusLine back.
  EOS
end
