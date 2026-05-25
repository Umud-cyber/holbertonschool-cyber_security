#!/bin/bash

require 'json'

def count_user_ids(path)
  # 1. JSON faylını oxuyuruq və Ruby obyektinə (Massivə) çeviririk
  file_content = File.read(path)
  data = JSON.parse(file_content)

  # 2. Hər bir elementdən 'userId' dəyərini götürüb yeni massiv yaradırıq
  user_ids = data.map { |item| item['userId'] }

  # 3. 'tally' metodu ilə hansı ID-dən neçə dənə olduğunu hesablayırıq
  # Məsələn: {1=>10, 2=>8, ...} formatında bir heş qaytarır
  counts = user_ids.tally

  # 4. Nəticəni istənilən formatda (userId: count) ekrana çıxarırıq
  counts.each do |user_id, count|
    puts "#{user_id}: #{count}"
  end
end
