require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php55Raphf < AbstractPhp55Extension
  init
  homepage 'http://pecl.php.net/package/raphf'
  url 'http://pecl.php.net/get/raphf-1.0.4.tgz'
  sha1 'ba1528c32a4fb1f632da321f67875d3be6322ce1'

  def install
    Dir.chdir "raphf-#{version}"

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    include.install %w(php_raphf.h)
    prefix.install "modules/raphf.so"
    write_config_file if build.with? "config-file"
  end
end
