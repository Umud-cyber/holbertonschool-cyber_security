#!/bin/bash

def print_arguments
  if ARGV.empty?
    puts "No arguments provided."
  else
    # Öncə bütün çıxışı bir string kimi massivə yığırıq
    output = ["Arguments:"]
    
    ARGV.each_with_index do |arg, index|
      output << "#{index + 1}. #{arg}"
    end
    
    # Massivi yeni sətirlərlə birləşdiririk və SONUNA mütləq bir dənə \n qoyuruq
    # Bu üsul faylın sonunda enter olub-olmamasından asılı olmayaraq HƏMİŞƏ eyni baytı verəcək
    final_string = output.join("\n") + "\n"
    
    # Ekrana print ilə çıxarırıq (print əlavə newline qoymur, nə yazılıbsa onu çıxarır)
    print final_string
  end
end
