#!/bin/bash

# Ruby-nin daxili Prime klassını istifadə etmək üçün kitabxananı daxil edirik
require 'prime'

def prime(number)
  # Prime.prime? metodu ədəd sadədirsə true, mürəkkəbdirsə false qaytarır
  Prime.prime?(number)
end
