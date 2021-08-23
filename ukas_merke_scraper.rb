#! /usr/bin/env ruby
# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require 'date'

doc = Nokogiri::HTML(URI.open('https://www.vpg.no/tilbud/ukas-merke'))

ukas_merke = doc.css('div h1 span').text.sub('Ukas merke', '')
puts ukas_merke
File.open('ukas_merke.txt', 'a') do |f|
  f.write(Time.now.strftime('%Y.%m.%d - '))
  f.puts(ukas_merke)
end
