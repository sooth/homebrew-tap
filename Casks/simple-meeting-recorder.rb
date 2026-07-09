cask "simple-meeting-recorder" do
  version "1.6"
  sha256 "3579a01cf262fbbdcf95cef9bc23748662c28d029c64e859913eb1ae17b7d8d4"

  url "https://simplemeetingrecorder.dmalson.com/releases/SimpleMeetingRecorder-#{version}.zip"
  name "Simple Meeting Recorder"
  desc "On-device meeting recorder and transcript for the Mac menu bar"
  homepage "https://simplemeetingrecorder.dmalson.com/"

  livecheck do
    url "https://simplemeetingrecorder.dmalson.com/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: ">= :sequoia"
  depends_on arch: :arm64

  app "SimpleMeetingRecorder.app"

  zap trash: [
    "~/Library/Preferences/com.davidmalson.SimpleMeetingRecorder.plist",
  ]
end
