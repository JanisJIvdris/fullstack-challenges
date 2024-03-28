require "csv"

class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 0
    load_csv if File.exist?(csv_file) && File.empty?(csv_file) == false
  end

  def create(element)
    @next_id += 1
    element.id = @next_id
    @elements << element
    save_csv
  end

  def all
    @elements
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end
end
