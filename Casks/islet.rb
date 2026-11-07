cask "islet" do
  version "0.3.0"
  sha256 "30b5a8b4c58ab5a9e0ffb72a5e56f88b0eb3fb7b2a4f25e9fa204180a4f736ac"

  url "https://github.com/Dhivyadhanush/islet/releases/download/v#{version}/Islet-#{version}.dmg"
  name "Islet"
  desc "Minimal dynamic island for the MacBook notch"
  homepage "https://github.com/Dhivyadhanush/islet"

  app "Islet.app"

  zap trash: [
    "~/Library/Preferences/dev.dhanuz.islet.plist",
  ]

  caveats do
    <<~EOS
      Islet is ad-hoc signed. On first launch, right-click Islet in Applications
      and choose Open.

      If macOS still blocks it, run:
        sudo xattr -dr com.apple.quarantine /Applications/Islet.app
    EOS
  end
end
