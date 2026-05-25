#!/bin/bash

require 'net/http'
require 'uri'
require 'json' # Səliqəli formatlama üçün JSON kitabxanasını daxil edirik

def get_request(url)
  uri = URI.parse(url)
  response = Net::HTTP.get_response(uri)

  puts "Response status: #{response.code} #{response.message}"
  puts "Response body:"
  
  begin
    # Gələn body-ni parse edib yenidən səliqəli (pretty) formata salırıq
    # Bu üsul {} yazısını avtomatik olaraq alt-bata sətirlərə böləcək
    parsed_body = JSON.parse(response.body)
    puts JSON.pretty_generate(parsed_body)
  rescue
    # Əgər hər hansı bir səbəbdən gələn yazı JSON deyilsə, olduğu kimi çıxarsın
    puts response.body
  end
end
