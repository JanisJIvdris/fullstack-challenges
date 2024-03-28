require_relative "../models/employee"
require "csv"

class EmployeeRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    load_csv if File.exist?(@csv_file)
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  def find_by_username(username)
    @elements.find { |employee| employee.username == username }
  end

  def all_riders
    @elements.select { |employee| employee.role == "rider" }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @elements << Employee.new(row)
    end
  end
end
