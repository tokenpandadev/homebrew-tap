cask "tokenpanda" do
  version "0.1.2"
  sha256 "191e88a77cb3f07a62d61598c974ec72fc54aca18987e485f0a8766196a466bb"

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
