require 'rubygems'
require 'httparty'
require 'json'
require 'io/console'
require_relative 'utils.rb'
require 'colorize'


puts '** Consulta de saldo Ticket **'.red
puts 'Insira seu e-mail: '.yellow
email = gets.chomp

puts 'Insira sua senha: '.yellow
password = STDIN.noecho(&:gets).chomp

options = {:body =>
               {
                :email => email,
                :password => password
               }
}

utils = Utils.new
auth_results = utils.authorize(options)
parsed_json = JSON.parse(auth_results)
authorization = "Bearer #{parsed_json["access_token"]}"

ticket_info = utils.ticket_info(authorization, parsed_json["id_user"])

parsed_ticket_info = JSON.parse(ticket_info)

ticket_balance = parsed_ticket_info["value"][0]["balance"]["value"]

puts "Seu saldo atual é R$#{ticket_balance}".light_blue
