#! /usr/bin/env ruby
# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require 'date'

doc = Nokogiri::HTML(URI.open('https://www.vpg.no/tilbud/dagens'))

doc.css('table tbody tr td div h2 span').each do |span|
  dagens = span.text
  puts dagens
  File.open('dagens.txt', 'a') do |f|
    f.write(Time.now.strftime('%Y.%m.%d - '))
    f.puts(dagens)
  end
end
