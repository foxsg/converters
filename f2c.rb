# frozen_string_literal: true

#! /usr/local/bin/env ruby

# convert F to C and C to F
# how we get there:

# Fahrenheit to Celsius
# (F − 32) × 5/9 = C

# Celsius to Fahrenheit
# (9/5) * C + 32 = F


# to run:
# on the command-line, execute
#    `f2c <temp_in_fahrenheit>`
# or
#    `c2f <temp_in_celsius>`
# (omit back-ticks)

# where temp_in_fahrenheit or
# temp_in_celsius = the temperature to convert

# e.g., to convert -11 F to degrees C:
#
# $> f2c -11

# f2c and c2f are aliased to the same command
# the code figures out which one was called
# and processes the conversion accordingly
# that said, to some extent the code assumes you know what you are doing.

# aliases in .bashrc / .zshrc
#   alias c2f='ruby ~/code/snippets/f2c.rb c2f'
#   alias f2c='ruby ~/code/snippets/f2c.rb f2c'

# arg0 is the command called from the command line
# arg1 is the units to be converted

# note there is no check if an acutal number was entered or not.
# non-numerals will be converted to integers and thus rendered null
# and thus interpreted as zero.
# so, `f2c yup` will condense yup to null and convert
# zero degrees fahrenheit to degrees celsius.

# plenny of room for improvement to this code


arg0 = ARGV[0]
arg1 = ARGV[1]

def convert_faherenheit_to_celsius(f,arg0)
  c = ((f.to_i - 32) * 5)/9
  print_conversion(f,c,arg0)
end

def convert_celsius_to_fahrenheit(c,arg0)
  f = ((c.to_i * 9)/5) + 32
  print_conversion(c,f,arg0)
end

def print_conversion(var, result, arg0)
  summoner    =  caller_locations.first.label
  convertee   = summoner.split('_')[1]
  converted   = summoner.split('_')[3]
  puts "#{var} #{convertee} equals #{result} #{converted}"
end


def convert(arg0, arg1)
  case arg0
  when 'f2c'
    convert_faherenheit_to_celsius(arg1, arg0)
  when 'c2f'
    convert_celsius_to_fahrenheit(arg1, arg0)
  else
    puts "alias not recognized."
  end
end

convert(arg0, arg1)
