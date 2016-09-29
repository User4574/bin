#!/usr/bin/env ruby

num = ARGV.shift
exit 1 if num.nil?

case File.basename($PROGRAM_NAME)
when 'd'
  num = num.to_i(10)
when 'h'
  num = num.to_i(16)
when 'o'
  num = num.to_i(8)
when 'b'
  num = num.to_i(2)
end

dec = hex = oct = bin = true
out = ARGV.shift
case out
when 'd'
  hex = oct = bin = false
when 'h'
  dec = oct = bin = false
when 'o'
  dec = hex = bin = false
when 'b'
  dec = hex = oct = false
end

puts "    Decimal : #{num.to_s(10)}" if dec
puts "Hexadecimal : #{num.to_s(16)}" if hex
puts "      Octal : #{num.to_s(8)}" if oct
puts "     Binary : #{num.to_s(2)}" if bin
