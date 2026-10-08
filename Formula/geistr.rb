class Geistr < Formula
  desc "Local LLM chat, model catalog and service on the geist engine (GGUF)"
  homepage "https://github.com/geisten/geist-runtime"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/geisten/geist-runtime/releases/download/v0.2.0/geistr-macos-arm64.tar.gz"
      sha256 "5dbcec52d0454d6fe5b79a7eaad076e34945a8930f0d69478b504816116bfb51"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/geisten/geist-runtime/releases/download/v0.2.0/geistr-linux-arm64.tar.gz"
      sha256 "aaa642bfe742f04aeac15793ca22ad2aceee46f219b4e4de4c15ea7cc6ad6720"
    end
    on_intel do
      url "https://github.com/geisten/geist-runtime/releases/download/v0.2.0/geistr-linux-amd64.tar.gz"
      sha256 "dfcb2795b96a2e722ea382bf20f6321151b6c759f06e2a768d0f02b3475d1cde"
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
