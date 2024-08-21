cask "flutter" do
  arch arm: "_arm64"

  version "3.24.1"
  sha256 arm:   "6ad307c7d780ff5003f205687892abb7c0b4d06b07be85b20d347aa006fadb9b",
         intel: "8475e6b64c0f4847a6285476d3b3fcb6bd972915d1eadef58ff769bfad86166f"

  url "https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos#{arch}_#{version}-stable.zip",
      verified: "storage.googleapis.com/flutter_infra_release/releases/stable/macos/"
  name "Flutter SDK"
  desc "UI toolkit for building applications for mobile, web and desktop"
  homepage "https://flutter.dev/"

  livecheck do
    url "https://storage.googleapis.com/flutter_infra_release/releases/releases_macos.json"
    regex(%r{/flutter[._-]macos[._-]v?(\d+(?:\.\d+)+)[._-]stable\.zip}i)
  end

  auto_updates true

  binary "flutter/bin/dart"
  binary "flutter/bin/flutter"

  postflight do
    FileUtils.ln_sf("#{staged_path}/flutter", "#{HOMEBREW_PREFIX}/share/flutter")
  end

  uninstall_postflight do
    FileUtils.rm("#{HOMEBREW_PREFIX}/share/flutter")
  end

  zap trash: "~/.flutter"
end
