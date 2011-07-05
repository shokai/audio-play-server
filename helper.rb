require 'bundler/setup'
require 'open-uri'
require 'yaml'
require 'haml'
require 'cgi'

begin
  @@conf = YAML::load open(File.dirname(__FILE__)+'/config.yaml').read
  p @@conf
rescue => e
  STDERR.puts 'config.yaml load error!'
  STDERR.puts e
  exit 1
end

def app_root
  "#{env['rack.url_scheme']}://#{env['HTTP_HOST']}#{env['SCRIPT_NAME']}"
end

def get_audio_file(url)
  FileUtils.mkdir_p @@conf['tmp_dir'] 
  fname = "#{@@conf['tmp_dir']}/#{CGI.escape(url)}"
  unless File.exists? fname
    begin
      File.open(fname,'w+'){|f|
        f.write open(url).read
      }
    rescue Timeout::Error => e
      STDERR.puts e
      File.delete fname
    rescue => e
      STDERR.puts e
      File.delete fname
    end
  end
  fname
end
