Audio Play Server
=================

post mp3 URL => play


Dependencies
------------

* Mac OSX or Linux
* Sinatra
* afplay or mpg321
* pkill (proctools)



Install Dependencies
--------------------

    % gem install bundler
    % bundle install
    
    % sudo apt-get install mpg321 # for Ubuntu

    % brew install proctools # for MacOSX


Run Server
----------

edit "config.yaml"


run

    % ruby development.ru


for Passenger, use config.ru
