# Copyright 2023 Elijah Gordon (NitrixXero) <nitrixxero@gmail.com>

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

require 'securerandom'

VERSION = "1.0"

def generate_password(length, include_lowercase, include_uppercase, include_numbers, include_symbols)
  characters = []
  characters << ('a'..'z').to_a if include_lowercase
  characters << ('A'..'Z').to_a if include_uppercase
  characters << ('0'..'9').to_a if include_numbers
  characters << ['!', '@', '#', '$', '%', '^', '&', '*'] if include_symbols
  
  password = ''
  length.times { password << characters.flatten.sample }
  password
end

def generate_menu
  puts "Advanced Password Generator v#{VERSION}"
  puts "1. Generate Password"
  puts "2. Exit"
  print "Enter your choice: "
  gets.chomp.to_i
end

loop do
  choice = generate_menu
  
  case choice
  when 1
    print "Enter password length: "
    length = gets.chomp.to_i
    
    print "Include lowercase letters? (y/n): "
    include_lowercase = gets.chomp.downcase == 'y'
    
    print "Include uppercase letters? (y/n): "
    include_uppercase = gets.chomp.downcase == 'y'
    
    print "Include numbers? (y/n): "
    include_numbers = gets.chomp.downcase == 'y'
    
    print "Include symbols? (y/n): "
    include_symbols = gets.chomp.downcase == 'y'
    
    puts "Generated Password: #{generate_password(length, include_lowercase, include_uppercase, include_numbers, include_symbols)}"
  when 2
    puts "Exiting..."
    break
  else
    puts "Invalid choice. Please enter 1 or 2."
  end
end
