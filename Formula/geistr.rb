class Geistr < Formula
  desc "Local LLM chat, model catalog and service on the geist engine (GGUF)"
  homepage "https://github.com/geisten/geist-runtime"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/geisten/geist-runtime/releases/download/v0.1.0/geistr-macos-arm64.tar.gz"
      sha256 "0123d9b7e8fe175a9776f17ef87b386f1166eec84d85ee190e4cedaff65874a7"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/geisten/geist-runtime/releases/download/v0.1.0/geistr-linux-arm64.tar.gz"
      sha256 "997b1978204e9abc8d00684ae7fd1958e5c2b38a94cb42d250addf3ab1897441"
    end
    on_intel do
      url "https://github.com/geisten/geist-runtime/releases/download/v0.1.0/geistr-linux-amd64.tar.gz"
      sha256 "56662b29b3d4a38e6e065ac8778e4a49fe4bf34f1d778ab3987e63ada12b1466"
    end
  end

  def install
    bin.install "geistr"
  end

  def caveats
    <<~EOS
      Install a model and chat:
        geistr catalog
        geistr pull smollm2-360m
        geistr chat smollm2-360m
    EOS
  end

  test do
    assert_match "geistr #{version}", shell_output("#{bin}/geistr --version")
  end
end
