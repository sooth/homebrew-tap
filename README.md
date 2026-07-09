# sooth/homebrew-tap

Homebrew tap for [Simple Meeting Recorder](https://simplemeetingrecorder.dmalson.com/),
[CalSync](https://sync365cal.com/), and related apps.

## Install CalSync

Apple Silicon Mac, macOS 13 (Ventura) or later:

```bash
brew install --cask sooth/tap/calsync
```

Or:

```bash
brew tap sooth/tap
brew install --cask calsync
```

The app lands in `/Applications`. After install it keeps itself current via Sparkle
(in-app updates). On first launch it registers as a login item and starts the
menu-bar sync client.

## Install Simple Meeting Recorder

Apple Silicon Mac, macOS 15 (Sequoia) or later. **Use the fully-qualified name** (this is not in official `homebrew/cask`):

```bash
brew install --cask sooth/tap/simple-meeting-recorder
```

That one command taps `sooth/homebrew-tap` and installs the cask. On Homebrew 6+ it also trusts only this cask for the install.

### If you see “No Cask with this name exists”

You almost certainly ran the **short** name without the tap:

```bash
# ❌ not enough — brew only looks in official casks
brew install --cask simple-meeting-recorder
```

Use the fully-qualified form instead (above), or:

```bash
brew tap sooth/tap
brew install --cask sooth/tap/simple-meeting-recorder
```

On Homebrew 6 with tap trust, prefer the fully-qualified install; it avoids “cask not found” from an untrusted short-name lookup.

### Optional: trust the whole tap (or just this cask)

```bash
brew trust --cask sooth/tap/simple-meeting-recorder
# or, broader:
brew trust sooth/tap
```

## What you get

The app lands in `/Applications`. After install it keeps itself current via Sparkle (in-app updates). Microphone and System Audio Recording are requested on first use.

## Uninstall

```bash
brew uninstall --cask calsync
brew uninstall --cask simple-meeting-recorder
```

Preferences only (does not delete user data under Application Support / Recordings):

```bash
brew uninstall --cask --zap calsync
brew uninstall --cask --zap simple-meeting-recorder
```
