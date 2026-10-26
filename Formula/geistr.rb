class Geistr < Formula
  desc "Local LLM chat, model catalog and service on the geist engine (GGUF)"
  homepage "https://github.com/geisten/geist-runtime"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://www.geisten.net/download/geistr/v0.4.0/geistr-macos-arm64.tar.gz"
      sha256 "a2b4af8b6c730257cb2270e06a1ef4f5c84cb93b6a917662310b04e22e277cb2"
    end
  end
  on_linux do
    on_arm do
      url "https://www.geisten.net/download/geistr/v0.4.0/geistr-linux-arm64.tar.gz"
      sha256 "4e9907c514e811c1a24e3a74bf53dc7356bed7ebe8370f975de3e3fffb31f5f9"
    end
    on_intel do
      url "https://www.geisten.net/download/geistr/v0.4.0/geistr-linux-amd64.tar.gz"
      sha256 "5fff8f12780f860b03b81b01e3b3249226a9246fdf49de5520132bffb0979365"
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
