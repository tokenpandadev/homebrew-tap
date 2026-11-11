# tokenpanda tap

Homebrew tap for [tokenpanda](https://tokenpanda.dev), a macOS menu bar app for the pace of your Claude plan.

With Homebrew, from my tap:

```sh
brew install --cask tokenpandadev/tap/tokenpanda
```

Homebrew trusts a cask installed by its full name, and only that one, so there is no trust step.

The app is signed ad hoc, not notarised, so macOS blocks it the first time. Open System Settings, Privacy & Security, scroll down and click Open Anyway. The warning comes back once more: click Open Anyway again and enter your Mac password or use Touch ID. From then on it opens normally.
