cask "mindledger" do
  version "0.1"
  sha256 "5734053119c3e946ea6b37cae5404a752abc1341651fe9eccdce0d68e2a461e6"

  url "https://mindledger.dmalson.com/releases/Mindledger-#{version}.zip"
  name "Mindledger"
  desc "Knowledge base of reviewed drafts from mail, meetings and agent notes"
  homepage "https://mindledger.dmalson.com/"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  # ~/Applications unless --appdir is passed or set in HOMEBREW_CASK_OPTS: no admin
  # password needed. An explicit --appdir sticks on reinstall.
  appdir_chosen = cask.config.explicit.key?(:appdir) || cask.config.env.key?(:appdir)
  app_root = appdir_chosen ? appdir : "#{Dir.home}/Applications"
  app "Mindledger.app", target: "#{app_root}/Mindledger.app"

  # Clear a manual / non-cask copy in either Applications folder so brew can land.
  preflight_steps do
    remove ["/Applications/Mindledger.app", "~/Applications/Mindledger.app"], recursive: true, sudo: :if_needed
  end

  zap trash: "~/Library/Preferences/com.dmalson.Mindledger.plist"

  caveats do
    <<~EOS
      Your knowledge base lives in ~/Library/Application Support/Mindledger/
      and is not removed by brew uninstall --zap.
    EOS
  end
end
