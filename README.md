# sooth/homebrew-tap

Homebrew tap for [Simple Meeting Recorder](https://simplemeetingrecorder.dmalson.com/) and related apps.

## Install Simple Meeting Recorder

Apple Silicon Mac, macOS 15 (Sequoia) or later:

```bash
brew install --cask sooth/tap/simple-meeting-recorder
```

Or:

```bash
brew tap sooth/tap
brew install --cask simple-meeting-recorder
```

The app lands in `/Applications`. After install it keeps itself current via Sparkle (in-app updates). Microphone and System Audio Recording are requested on first use.

## Uninstall

```bash
brew uninstall --cask simple-meeting-recorder
```

Preferences only (does not delete `~/Recordings`):

```bash
brew uninstall --cask --zap simple-meeting-recorder
```
