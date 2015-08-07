require_relative 'menu'
require 'text'

class Order

	attr_reader :order
	attr_accessor :texted

	def initialize
		@order = {}
		@texted = false
	end

	def new_order(list,total_cost)
		print_order(list,total_cost)
	end

	def place_order
		fail "No order has been entered" if order == {}
		send_text
	end

	def send_text
  	Text.new.deliver
  	@texted = true
	end

	def print_order(list,total_cost)
		puts "ORDER SUMMARY"
		list.each do |x,y|
			dish = menu_keys[x - 1]
			cost = menu_values[x - 1] * y
			puts "#{(list.index([x,y]))+1}. #{dish}   x #{y}   £#{cost}"
			order.merge!({dish => cost})
			print_total_order(total_cost)
		end
	end

	def print_total_order(total_cost)
		sum = 0
		order.values.each {|a| sum += a }
		fail "Total cost is incorrect" if sum != total_cost
		puts "TOTAL COST - £#{total_cost}" 
		return "TOTAL COST - £#{total_cost}"
	end

	def show_menu
		puts "MENU"
		menu_list.each_with_index do |(key, value), index|
  		puts "#{index + 1}: #{key} - £#{value}\n"
		end
	end

	def menu_keys
		menu_list.keys
	end

	def menu_values
		menu_list.values
	end
end