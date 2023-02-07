#! /usr/bin/env ruby
# frozen_string_literal: true

require 'date'
require 'json'
require 'nokogiri'
require 'open-uri'

filePath = './_data/ukas_merke.json'
data = JSON.parse(File.read(filePath))
doc = Nokogiri::HTML(URI.open('https://www.vpg.no/tilbud/ukas-merke'))

ukas_merke = doc.css('div h1 span').text.sub('Ukas merke', '')
puts ukas_merke

date = Time.now.strftime('%Y.%m.%d')
data[date] = ukas_merke

File.open(filePath, 'w') do |file|
  JSON.dump(data, file)
end
