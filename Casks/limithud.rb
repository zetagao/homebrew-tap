cask "limithud" do
  version "2.1"
  sha256 "5a7589a3bdf3ba5d21f2c8f75776fc6d8a406f02c70a6e3b839f7983d9f1f061"

  url "https://github.com/zetagao/LimitHUD/releases/download/v#{version}/LimitHUD.zip"
  name "LimitHUD"
  desc "Menu-bar HUD for live Claude and Codex usage quotas"
  homepage "https://github.com/zetagao/LimitHUD"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "LimitHUD.app"

  zap trash: [
    "~/Library/HTTPStorages/com.zetagao.limithud",
    "~/Library/Preferences/com.zetagao.limithud.plist",
  ]

  caveats <<~EOS
    LimitHUD is open source and code-signed, but not Apple-notarized.
    If you installed without --no-quarantine, macOS will block the first
    launch — approve it in System Settings → Privacy & Security → "Open
    Anyway". To skip that, install with:

      brew install --no-quarantine zetagao/tap/limithud

    On first run, allow the Keychain prompt (reads your browser's cookie
    key locally) and the notification prompt.
  EOS
end
