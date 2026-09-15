cask "extractor" do
  version "0.1.1"
  sha256 "f63c73b07f24837d6ece8f1ff80d51484a792b904420fe3354df4cf29a9b3414"

  url "https://github.com/sooth/extractor-releases/releases/download/v#{version}/Extractor-#{version}.zip"
  name "Extractor"
  desc "Archive Outlook mail and Teams chats from a signed-in session"
  homepage "https://extractor.dmalson.com/"

  depends_on macos: :ventura
  depends_on arch: :arm64

  app "Extractor.app"
  binary "#{appdir}/Extractor.app/Contents/MacOS/extractor"

  # Clear a manual / non-cask install so brew can land (same .app path).
  preflight do
    app = Pathname("/Applications/Extractor.app")
    next unless app.exist?

    ohai "Removing existing #{app.basename} so Homebrew can install"
    FileUtils.rm_r(app)
  end

  zap trash: "~/Library/Preferences/com.dmalson.Extractor.plist"

  caveats do
    <<~EOS
      Extractor is a CLI. After install:

        extractor login
        extractor whoami
        extractor mail --days 7
        extractor teams --days 7

      Mail and chat archives stay in ~/Library/Application Support/MSExtractor/
      and are not removed by brew uninstall --zap.
    EOS
  end
end
