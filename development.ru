require 'rubygems'
require 'rack'
require 'sinatra'
require 'sinatra/reloader'
require File.dirname(__FILE__)+'/helper'
require File.dirname(__FILE__)+'/main'

set :environment, :development

set :port, 8102
set :server, 'thin'

Sinatra::Application.run
