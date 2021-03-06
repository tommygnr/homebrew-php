require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php56Lz4 < AbstractPhp56Extension
  init
  homepage 'https://code.google.com/p/lz4/'
  url 'https://github.com/kjdev/php-ext-lz4/archive/0.2.0.tar.gz'
  sha1 '5622f65c1f357b7cf5cd7542fad811f582151883'

  def install
    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/lz4.so"
    write_config_file if build.with? "config-file"
  end
end
