class Customer
  attr_accessor :id, :name, :address

  def initialize(attrs = {})
    @id      = attrs[:id]
    @name    = attrs[:name]
    @address = attrs[:address]
  end
end
