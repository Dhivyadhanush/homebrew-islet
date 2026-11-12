cask "islet" do
  version "1.1.0"
  sha256 "5346caf67d522770def5dc5e1f044272275de9eb27e6bf6cf41eae35fb047c86"

  url "https://github.com/Dhivyadhanush/islet/releases/download/v#{version}/islet-#{version}.dmg"
  name "islet"
  desc "Minimal dynamic island for the MacBook notch"
  homepage "https://github.com/Dhivyadhanush/islet"

  depends_on macos: :sonoma

  app "islet.app"

  # Ad-hoc signed releases need the download flag cleared. A notarized
  # Developer ID build does not, but the command is harmless there.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "/Applications/islet.app"]
  end

  uninstall quit: "dev.dhanuz.islet"

  zap trash: [
    "~/Library/Application Support/islet",
    "~/Library/Caches/dev.dhanuz.islet",
    "~/Library/HTTPStorages/dev.dhanuz.islet",
    "~/Library/Preferences/dev.dhanuz.islet.plist",
    "~/Library/Saved Application State/dev.dhanuz.islet.savedState",
  ]

  caveats do
    <<~EOS
      islet is ad-hoc signed. The cask clears the download quarantine flag
      after install, so it opens normally.

      If an older copy is still blocked, use System Settings → Privacy &
      Security → Open Anyway, or run:
        xattr -dr com.apple.quarantine /Applications/islet.app
    EOS
  end
end
