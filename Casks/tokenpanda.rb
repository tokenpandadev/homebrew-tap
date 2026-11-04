cask "tokenpanda" do
  version "0.1.14"
  sha256 "bb6f4a0d9703642178cd76102853c37180e569ddbb39b7a5b1044dc7ead2656b"

  url "https://github.com/tokenpandadev/tokenpanda-app/releases/download/v#{version}/tokenpanda-#{version}.zip"
  name "tokenpanda"
  desc "Menu bar pace for Claude Code plan windows, and the Mac's own figures"
  homepage "https://tokenpanda.dev"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "tokenpanda.app"

  uninstall quit: "dev.tokenpanda.app"

  # The app's own Remove runs first, in zap only: uninstall directives also run on every upgrade and would strip
  # the status line entry each time. It is remove.sh, which the app writes into its data folder at Install and
  # Remove, not the app binary: Homebrew before 7.0.10 deletes the app before it runs a zap script. The script
  # lives until the trash step below. It is the same Remove as `tokenpanda --remove-status-line`, in sh and plutil.
  zap script: {
        executable:   "/bin/sh",
        args:         ["-c", '[ ! -f "$0" ] || /bin/sh "$0"',
                       File.expand_path("~/Library/Application Support/dev.tokenpanda.app/remove.sh")],
        must_succeed: false,
      },
      trash:  [
        "~/Library/Application Support/dev.tokenpanda.app",
        "~/Library/Preferences/dev.tokenpanda.app.plist",
      ]

  caveats <<~EOS
    The app is signed ad hoc, not notarised. On first launch macOS blocks it:
    open System Settings, Privacy & Security, and click Open Anyway.

    brew uninstall --zap removes the status line entry and puts back the one
    you had before, once tokenpanda 0.1.9 or later has run at least once.
    With a plain brew uninstall, first open tokenpanda's Settings tab and
    click "Remove the status line entry".
  EOS
end
