cask "tokenpanda" do
  version "0.1.3"
  sha256 "9c6ae99cc86a7e6eb7c43eb864d992c2a3ef39c17e5d8e4d2c4149ef79878565"

  url "https://github.com/tokenpandadev/tokenpanda-app/releases/download/v#{version}/tokenpanda-#{version}.zip"
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
