cask "clientry" do
  version "1.5.1"
  sha256 "8dbfe3364026fb6faa870fea70a3e6608cd961f86aee0cdc9e7dc051f65aa951"

  url "https://clientry.dmalson.com/releases/Clientry-#{version}.zip"
  name "Clientry"
  desc "Project management for freelancers and solo professionals"
  homepage "https://clientry.dmalson.com/"

  depends_on macos: :sonoma

  # ~/Applications unless --appdir is passed or set in HOMEBREW_CASK_OPTS: no admin
  # password needed. An explicit --appdir sticks on reinstall.
  appdir_chosen = cask.config.explicit.key?(:appdir) || cask.config.env.key?(:appdir)
  app_root = appdir_chosen ? appdir : "#{Dir.home}/Applications"
  app "Clientry.app", target: "#{app_root}/Clientry.app"

  zap trash: "~/Library/Preferences/com.clientry.app.plist"
end
