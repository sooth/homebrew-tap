cask "simple-meeting-recorder@beta" do
  version "1.8-beta1"
  sha256 "882a7002f71e45deb06dc94f2bd552b78f03fe176d68e6f8215e97aa2770bf42"

  url "https://github.com/sooth/simple-meeting-recorder-releases/releases/download/v#{version}/SimpleMeetingRecorder-#{version}.zip"
  name "Simple Meeting Recorder"
  desc "On-device meeting recorder and transcript for the menu bar (beta)"
  homepage "https://simplemeetingrecorder.dmalson.com/"

  # Manual bumps for prereleases; production Sparkle feed stays on stable.
  livecheck do
    skip "Beta channel — versions are bumped manually in this cask"
  end

  auto_updates true
  conflicts_with cask: "simple-meeting-recorder"
  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "SimpleMeetingRecorder.app"

  zap trash: "~/Library/Preferences/com.davidmalson.SimpleMeetingRecorder.plist"
end
