#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

before do
  @title = 'Audio Play Server'
end

get '/' do
  haml :index
end

post '/play' do
  url = params['url']
  fname = get_audio_file(url)
  system "#{@@conf['stopper']}"
  IO.popen "#{@@conf['player']} '#{fname}'"
  url
end

post '/stop' do
  system "#{@@conf['stopper']}"
end
