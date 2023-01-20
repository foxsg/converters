#!/usr/local/bin/env ruby

# convert inches to centimeters and centimeters to inches
# how we get there:

# Inches to Centimeters
# 1 inch equals 2.54 centimeters

# Centimeters to inches
# 1 cm equals 0.3937 inches

# on the command-line, execute
#    `in2cm <inches>`
# or
#    `cm2in <centimters>`
# (omit back-ticks)

# where <inches> or <centimeters>
# equals the unit to convert

# e.g., to convert 19 inches to cm
#
# $> in2cm 19

# in2cm and cm2in are aliased to the same command
# the code figures out which one was called
# and processes the conversion accordingly
# that said, to some extent the code assumes you know what you are doing.

# aliases in .bashrc / .zshrc
#   alias in2cm 'ruby ~/code/snippets/f2c.rb in2cm'
#   alias cm2in 'ruby ~/code/snippets/f2c.rb cm2in'

# arg0 is the command called from the command line
# arg1 is the units to be converted

# n.b., there is no check if an acutal number was entered or not.
# non-numerals will be converted to integers and thus rendered null
# and thus interpreted as zero.
# so, `in2cm yup` will condense yup to null and convert
# zero inches to zero centimeters

# plenny of room for improvement to this code

arg0 = ARGV[0]
arg1 = ARGV[1]

def convert_inches_to_centimeters(inches, arg0)
  cm = inches.to_i * 2.54
  print_conversion(inches, cm, arg0)
end

def convert_centimeters_to_inches(cm, arg0)
  inches = cm.to_i * 0.3937
  print_conversion(cm,inches,arg0)
end

def print_conversion(var, result, arg0)
  summoner    = caller_locations.first.label
  convertee   = summoner.split('_')[1]
  converted   = summoner.split('_')[3]
  puts "#{var} #{convertee} equals #{result} #{converted}"
end

def convert(arg0, arg1)
  case arg0
  when 'in2cm'
    convert_inches_to_centimeters(arg1, arg0)
  when 'cm2in'
    convert_centimeters_to_inches(arg1, arg0)
  else
    puts 'alias not recognized.'
  end
end

convert(arg0, arg1)
