cask "lost-island" do
  version "0.7.1"
  sha256 "93cc6550a2da9e162951e4963300b1de709397dd61a51a284626bb1d56ca53f4"

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
