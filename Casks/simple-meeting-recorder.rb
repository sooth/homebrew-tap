cask "simple-meeting-recorder" do
  version "1.10.2"
  sha256 "21d51a4a761d3c8b3d5816e87e44da133569c84e7ecb8c48d0bfc5e5a282ad78"

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

  # Prefer user Applications (no admin). Override with --appdir if needed.
  #   brew install --cask --appdir=~/Applications sooth/tap/simple-meeting-recorder
  app "SimpleMeetingRecorder.app"

  # Same .app path as the beta cask. Auto-replace so switching back to stable
  # is a single brew install (no manual uninstall).
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
      candidates.each { |app| FileUtils.rm_r(app) if app.exist? }
      FileUtils.rm_r(other_room)
    elsif !this_room.directory?
      orphan = candidates.find(&:exist?)
      if orphan
        ohai "Removing existing #{orphan.basename} so stable can install"
        FileUtils.rm_r(orphan)
      end
    end
  end

  caveats <<~EOS
    Installs without an admin password if you target your user Applications folder:

      brew install --cask --appdir=~/Applications sooth/tap/simple-meeting-recorder
  EOS

  zap trash: "~/Library/Preferences/com.davidmalson.SimpleMeetingRecorder.plist"
end
