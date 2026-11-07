cask "lost-island" do
  version "0.4.0"
  sha256 "b128b8be227df1b3d245e5ff28ecd0d81b8836dc94cfa1fd49f3a3e9c762ad01"

  url "https://github.com/Dhivyadhanush/islet/releases/download/v#{version}/lost_Island-#{version}.dmg"
  name "lost_Island"
  desc "Minimal dynamic island for the MacBook notch"
  homepage "https://github.com/Dhivyadhanush/islet"

  app "lost_Island.app"

  zap trash: [
    "~/Library/Preferences/dev.dhanuz.islet.plist",
  ]

  preflight do
    legacy = "#{appdir}/Islet.app"
    system_command "/bin/rm", args: ["-rf", legacy] if File.exist?(legacy)
  end

  caveats do
    <<~EOS
      lost_Island is ad-hoc signed. On first launch, right-click lost_Island in
      Applications and choose Open.

      If macOS still blocks it, run:
        sudo xattr -dr com.apple.quarantine /Applications/lost_Island.app
    EOS
  end
end
