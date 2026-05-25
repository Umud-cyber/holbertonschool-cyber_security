#!/usr/bin/env ruby
require 'digest'

if ARGV.length != 2
  puts "Usage: 10-password_cracked.rb HASHED_PASSWORD DICTIONARY_FILE"
  exit 1
end

hashed_password = ARGV[0].downcase.strip
dictionary_file = ARGV[1]

unless File.exist?(dictionary_file)
  puts "Password not found in dictionary."
  exit 1
end

password_found = nil

File.foreach(dictionary_file) do |line|
  word = line.strip
  next if word.empty?

  if Digest::SHA256.hexdigest(word) == hashed_password
    password_found = word
    break
  end
end

if password_found
  puts "Password found: #{password_found}"
else
  puts "Password not found in dictionary."
end
