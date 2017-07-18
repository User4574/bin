#!/usr/bin/env ruby

num = ARGV.shift
exit 1 if num.nil?

case File.basename($PROGRAM_NAME)
when 'd'
  num = num.to_i(10)
when 'z'
  num = num.gsub(/x/i, 'a').gsub(/e/i, 'b').to_i(12)
when 'h'
  num = num.to_i(16)
when 'o'
  num = num.to_i(8)
when 'b'
  num = num.to_i(2)
when 'c'
  num = num.ord
end

dec = doz = hex = oct = bin = true
char = num > 31 && num < 128
out = ARGV.shift
case out
when 'd'
        doz = hex = oct = bin = char = false
when 'z'
  dec =       hex = oct = bin = char = false
when 'h'
  dec = doz =       oct = bin = char = false
when 'o'
  dec = doz = hex =       bin = char = false
when 'b'
  dec = doz = hex = oct =       char = false
when 'c'
  dec = doz = hex = oct = bin =        false
end

puts "    Decimal : #{num.to_s(10)}" if dec
puts "    Dozenal : #{num.to_s(12).gsub(/a/, 'X').gsub(/b/, 'E')}" if doz
puts "Hexadecimal : 0x#{num.to_s(16)}" if hex
puts "      Octal : 0#{num.to_s(8)}" if oct
puts "     Binary : 0b#{num.to_s(2)}" if bin
puts "      ASCII : '#{num.chr}'" if char
