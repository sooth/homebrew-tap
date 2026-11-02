cask "simple-meeting-recorder@beta" do
  version "1.8-beta2"
  sha256 "97f1136dfcdd997e7c5b98bc2b7447642788aba7fac90d084cd1395d6905e4cb"

  url "https://github.com/sooth/simple-meeting-recorder-releases/releases/download/v#{version}/SimpleMeetingRecorder-#{version}.zip"
  name "Simple Meeting Recorder"
  desc "On-device meeting recorder and transcript for the menu bar (beta)"
  homepage "https://simplemeetingrecorder.dmalson.com/"

  # Manual bumps for prereleases; production Sparkle feed stays on stable.
  livecheck do
    skip "Beta channel — versions are bumped manually in this cask"
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  # ~/Applications unless --appdir is passed or set in HOMEBREW_CASK_OPTS: no admin
  # password, and in-app updates never prompt. An explicit --appdir sticks on reinstall.
  appdir_chosen = cask.config.explicit.key?(:appdir) || cask.config.env.key?(:appdir)
  app_root = appdir_chosen ? appdir : "#{Dir.home}/Applications"
  app "SimpleMeetingRecorder.app", target: "#{app_root}/SimpleMeetingRecorder.app"

  # One SimpleMeetingRecorder.app: clear the other channel (same app) and any manual
  # copy in either Applications folder.
  preflight_steps do
    remove ["/Applications/SimpleMeetingRecorder.app", "~/Applications/SimpleMeetingRecorder.app"],
           recursive: true, sudo: :if_needed
    remove "{{HOMEBREW_PREFIX}}/Caskroom/simple-meeting-recorder", recursive: true
  end

  zap trash: "~/Library/Preferences/com.davidmalson.SimpleMeetingRecorder.plist"
end
