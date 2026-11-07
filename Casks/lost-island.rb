cask "lost-island" do
  version "0.8.1"
  sha256 "3141a83b63b45b4197250a56ea03a80ea135ba1faf777d2bff920d88b51c2b8d"

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
