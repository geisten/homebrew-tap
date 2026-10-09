class Geistr < Formula
  desc "Local LLM chat, model catalog and service on the geist engine (GGUF)"
  homepage "https://github.com/geisten/geist-runtime"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/geisten/geist-runtime/releases/download/v0.3.1/geistr-macos-arm64.tar.gz"
      sha256 "3f8ab9e46067febb8d1e3df19be2097b899777d2b0b1030a7baf9e17f10c75f7"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/geisten/geist-runtime/releases/download/v0.3.1/geistr-linux-arm64.tar.gz"
      sha256 "9099a93dee1e124aba3400fdcce1d95dec0414a4661a53199c0ce15897b1c47e"
    end
    on_intel do
      url "https://github.com/geisten/geist-runtime/releases/download/v0.3.1/geistr-linux-amd64.tar.gz"
      sha256 "04d8d6741f5ba04330768e28cdf32379cac1fe34198eb5b6c83a7c5851914a90"
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
      The OpenAI and Ollama APIs (replacing geist-serve):
        geistr serve smollm2-360m --http
    EOS
  end

  test do
    assert_match "geistr #{version}", shell_output("#{bin}/geistr --version")
  end
end
