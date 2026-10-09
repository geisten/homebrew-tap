class Geistr < Formula
  desc "Local LLM chat, model catalog and service on the geist engine (GGUF)"
  homepage "https://github.com/geisten/geist-runtime"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/geisten/geist-runtime/releases/download/v0.3.0/geistr-macos-arm64.tar.gz"
      sha256 "d82e520fd93fe8d030061d06be0f566d1515fa79217642640a3f22c027a980b3"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/geisten/geist-runtime/releases/download/v0.3.0/geistr-linux-arm64.tar.gz"
      sha256 "e70baf5ab604c1333f0659cdcb6818dd9b3cd27cc2fafeb3abe5a6c64a508b4a"
    end
    on_intel do
      url "https://github.com/geisten/geist-runtime/releases/download/v0.3.0/geistr-linux-amd64.tar.gz"
      sha256 "05314005b62d28532d21b1e756de41de421c029075aa1e75bcec80cbbe36e8cd"
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
