require "csv"
require_relative "../models/customer"
require_relative "base_repository"

class CustomerRepository < BaseRepository
  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id]      = row[:id].to_i
      row[:address] = row[:address].to_s
      @elements << Customer.new(row)
    end
    @next_id = @elements.last.id
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |row|
      row << ["id", "name", "address"]
      @elements.each do |customer|
        row << [customer.id, customer.name, customer.address]
      end
    end
  end
end
