#!/usr/local/bin/env ruby

# convert miles to km and km to miles
# how we get there:

# Miles to Kilometers
# 1 mile equals 1.60934 km

# Kilometers to Miles
# 1 km equals 0.621371 miles
# 8 km is practically 5 mi


# to run:
# on the command-line, execute
#    `mi2km <miles>`
# or
#    `km2mi <kilometers>`
# (omit back-ticks)

# where <miles> or <kilometers>
# equals the unit to convert

# e.g., to convert 19 miles to km
#
# $> mi2km 19

# mi2km and km2mi are aliased to the same command
# the code figures out which one was called
# and processes the conversion accordingly
# that said, to some extent the code assumes you know what you are doing.

# aliases in .bashrc / .zshrc
#   alias mi2km 'ruby ~/code/snippets/f2c.rb mi2km'
#   alias km2mi 'ruby ~/code/snippets/f2c.rb km2mi'

# arg0 is the command called from the command line
# arg1 is the units to be converted

# note there is no check if an acutal number was entered or not.
# non-numerals will be converted to integers and thus rendered null
# and thus interpreted as zero.
# so, `mi2km yup` will condense yup to null and convert
# zero miles to zero kilometers

# plenny of room for improvement to this code


arg0 = ARGV[0]
arg1 = ARGV[1]

def convert_miles_to_kilometers(mi,arg0)
  km = mi.to_i * 1.60934 
  print_conversion(mi, km, arg0)
end

def convert_kilometers_to_miles(km,arg0)
  mi = km.to_i * 0.621371
  print_conversion(km,mi,arg0)
end

def print_conversion(var, result, arg0)
  summoner    =  caller_locations.first.label
  convertee   = summoner.split('_')[1]
  converted   = summoner.split('_')[3]
  puts "#{var} #{convertee} equals #{result} #{converted}"
end


def convert(arg0, arg1)
  case arg0
  when 'mi2km'
    convert_miles_to_kilometers(arg1, arg0)
  when 'km2mi'
    convert_kilometers_to_miles(arg1, arg0)
  else
    puts "alias not recognized."
  end
end

convert(arg0, arg1)
