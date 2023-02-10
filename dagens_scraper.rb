#! /usr/bin/env ruby
# frozen_string_literal: true

require 'date'
require 'json'
require 'nokogiri'
require 'open-uri'

filePath = './_data/dagens.json'
data = JSON.parse(File.read(filePath))
doc = Nokogiri::HTML(URI.open('https://www.vpg.no/tilbud/dagens'))

doc.css('table tbody tr td div h2').each do |span|
  dagens = span.text
  puts dagens

  date = Time.now.strftime('%Y.%m.%d')
  data[date] = dagens

  File.open(filePath, 'w') do |file|
    file.write(JSON.pretty_generate(data))
  end
end
