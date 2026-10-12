class Geistr < Formula
  desc "Local LLM chat, model catalog and service on the geist engine (GGUF)"
  homepage "https://github.com/geisten/geist-runtime"
  version "0.3.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://www.geisten.net/download/geistr/v0.3.3/geistr-macos-arm64.tar.gz"
      sha256 "716c502513af9c7a83032930a07969bfe932439e2016d4c46fe4c83295989991"
    end
  end
  on_linux do
    on_arm do
      url "https://www.geisten.net/download/geistr/v0.3.3/geistr-linux-arm64.tar.gz"
      sha256 "0cde2f56ed556a4119c17e95c798b83bf6c2fadff56f16ea33c72b183e5329d1"
    end
    on_intel do
      url "https://www.geisten.net/download/geistr/v0.3.3/geistr-linux-amd64.tar.gz"
      sha256 "220c902ad622ad080b7f318c1032ef7155a2d061ad67b8ca587c1c393930ba16"
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
