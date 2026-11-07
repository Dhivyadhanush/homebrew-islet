cask "lost-island" do
  version "0.8.0"
  sha256 "08b36b95b79f973f4ee623584bb85107db41780fcc64137895f7bf9c22554adc"

  url "https://github.com/Dhivyadhanush/islet/releases/download/v#{version}/lost_Island-#{version}.dmg"
  name "lost_Island"
  desc "Minimal dynamic island for the MacBook notch"
  homepage "https://github.com/Dhivyadhanush/islet"

  app "lost_Island.app"

  zap trash: [
    "~/Library/Preferences/dev.dhanuz.islet.plist",
  ]

  caveats do
    <<~EOS
      lost_Island is ad-hoc signed. On first launch, right-click lost_Island in
      Applications and choose Open.

      If macOS still blocks it, run:
        sudo xattr -dr com.apple.quarantine /Applications/lost_Island.app
    EOS
  end
end
