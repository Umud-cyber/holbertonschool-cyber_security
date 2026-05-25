#!/usr/bin/env ruby
require 'open-uri'
require 'uri'
require 'fileutils'

# Arqument sayını dəqiq yoxlayırıq
if ARGV.length != 2
  puts "Usage: 9-download_file.rb URL LOCAL_FILE_PATH"
  exit 1
end

url = ARGV[0]
local_path = ARGV[1]

puts "Downloading file from #{url}..."

begin
  URI.open(url) do |remote_file|
    dir = File.dirname(local_path)
    FileUtils.mkdir_p(dir) unless Dir.exist?(dir)

    File.open(local_path, 'wb') do |local_file|
      local_file.write(remote_file.read)
    end
  end

  puts "File downloaded and saved to #{local_path}."
rescue StandardError => e
  puts "An error occurred: #{e.message}"
end
