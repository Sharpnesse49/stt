# a faire :
# - coder les call de la config
# - finir la func sync pour sync depuis le plus récmmtn modifé
# - add la possibilité d'avoir +2 mirrors
# - faire un beau readme+docs

require "optparse"
require "fileutils"
require "digest"
require "yaml"  

confpath = File.expand_path("~/.config/stt/config.yml")

unless File.file?(confpath);
  puts("no config file found, creating it.")
  FileUtils.mkdir_p(File.dirname(confpath))
  FileUtils.touch(confpath)
  File.write(confpath, "#see https://github.com/Sharpnesse49/stt to make a simple config.")
end

def comp;
  sha1 = Digest::SHA256.file("file1").hexdigest
  sha2 = Digest::SHA256.file("file2").hexdigest

  if sha1 != sha2;
   puts("file1 and file2 aren't the same.")
  else
    puts("file1 and file2 are the same, nothing to do.")
  end
end

def sync;
  FileUtils.cp("file1", "file2")
end

if ARGV[0] == "comp";
  comp
elsif ARGV[0] == "push";
  sync
else;
  puts("this arg dont exist, (comp, sync).")
end
