require 'rack/utils'
require 'colorize'

STATUS_CODE_TO_SYMBOL = Hash[Rack::Utils::SYMBOL_TO_STATUS_CODE.map {|symbol, code|
  [code, symbol]
}]

namespace :http do
  desc "Print HTTP status codes"
  task :status do
    print_header

    Rack::Utils::HTTP_STATUS_CODES.each do |code, desc|
      print_row code, desc
    end
  end

  namespace :status do
    desc 'Print HTTP status codes of 500 - 511'
    task '500' do
      print_header
      print_row_status_codes_start_with 5
    end

    desc 'Print HTTP status codes of 400 - 431'
    task '400' do
      print_header
      print_row_status_codes_start_with 4
    end

    desc 'Print HTTP status codes of 300 - 308'
    task '300' do
      print_header
      print_row_status_codes_start_with 3
    end

    desc 'Print HTTP status codes of 200 - 226'
    task '200' do
      print_header
      print_row_status_codes_start_with 2
    end

    desc 'Print HTTP status codes of 100 - 102'
    task '100' do
      print_header
      print_row_status_codes_start_with 1
    end
  end

  private

  def max_desc_length
    Rack::Utils::HTTP_STATUS_CODES.max_by {|code, desc| desc.size }.last.length
  end

  def print_header
    puts "code #{'description'.ljust(max_desc_length)} symbol".colorize(:green).bold
  end

  def print_row(code, desc)
    puts "#{code.to_s.ljust(4)} #{desc.ljust(max_desc_length)} :#{STATUS_CODE_TO_SYMBOL[code]}"
  end

  def print_row_status_codes_start_with(number)
    Rack::Utils::HTTP_STATUS_CODES.find_all {|code, desc|
      %r/\A#{number}/ === code.to_s
    }.each {|(status_code, description)|
      print_row status_code, description
    }
  end
end
