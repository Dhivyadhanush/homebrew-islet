cask "lost-island" do
  version "0.7.5"
  sha256 "2f503ee35b8570de6ae33163cda06c7450cce4dc9a99d984d19cd1d48e2618d9"

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
