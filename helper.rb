require 'bundler/setup'
require 'open-uri'
require 'yaml'
require 'haml'

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
  Dir.mkdir @@conf['tmp_dir'] unless File.exists? @@conf['tmp_dir']
  fname = "#{@@conf['tmp_dir']}/#{Time.now.to_i}"
  File.open(fname,'w+'){|f|
    f.write open(url).read
  }
  fname
end
