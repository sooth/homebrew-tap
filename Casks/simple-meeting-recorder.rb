cask "simple-meeting-recorder" do
  version "1.11.0"
  sha256 "c24fef3f056dbbc8b5f552ef3d9ebba69722074236eb9c91d0b8d89a3fd1ef8f"

  url "https://github.com/sooth/simple-meeting-recorder-releases/releases/download/v#{version}/SimpleMeetingRecorder-#{version}.zip"
  name "Simple Meeting Recorder"
  desc "On-device meeting recorder and transcript for the menu bar"
  homepage "https://simplemeetingrecorder.dmalson.com/"

  livecheck do
    url "https://simplemeetingrecorder.dmalson.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia
  depends_on arch: :arm64

  # Prefer user Applications (no admin password):
  #   brew install --cask --appdir=~/Applications sooth/tap/simple-meeting-recorder
  # Once installed that way, upgrades stay in ~/Applications without sudo.
  app "SimpleMeetingRecorder.app"

  # Same .app basename as the beta cask. Auto-replace so channel switch is one command.
  preflight do
    other = "simple-meeting-recorder@beta"
    other_room = HOMEBREW_PREFIX/"Caskroom"/other
    this_room = HOMEBREW_PREFIX/"Caskroom/simple-meeting-recorder"
    candidates = [
      Pathname.new(Dir.home)/"Applications/SimpleMeetingRecorder.app",
      Pathname("/Applications/SimpleMeetingRecorder.app"),
    ]

    if other_room.directory?
      ohai "Switching to stable: removing beta cask #{other}"
      candidates.each { |p| FileUtils.rm_r(p) if p.exist? }
      FileUtils.rm_r(other_room)
    elsif !this_room.directory?
      orphan = candidates.find(&:exist?)
      if orphan
        ohai "Removing existing #{orphan} so stable can install"
        FileUtils.rm_r(orphan)
      end
    end
  end

  zap trash: "~/Library/Preferences/com.davidmalson.SimpleMeetingRecorder.plist"

  caveats <<~EOS
    To avoid administrator passwords, install into your user Applications folder:

      brew install --cask --appdir=~/Applications sooth/tap/simple-meeting-recorder

    If an old copy is still in /Applications, remove it once (may ask for a password),
    then reinstall with --appdir=~/Applications as above.
  EOS
end
