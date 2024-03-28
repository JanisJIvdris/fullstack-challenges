require "csv"
require_relative "../models/order"

class OrderRepository
  def initialize(csv_file, meal_repo, customer_repo, employee_repo)
    @csv_file = csv_file
    @meal_repository = meal_repo
    @customer_repository = customer_repo
    @employee_repository = employee_repo
    @elements = []
    @next_id = 1
    load_csv if File.exist?(csv_file) && File.empty?(csv_file) == false
  end

  def create(order)
    order.id = @next_id
    @elements << order
    @next_id += 1
    save_csv
  end

  def all
    @elements
  end

  def undelivered_orders
    @elements.select { |element| element.delivered? == false }
  end

  def mark_delivered(order)
    order.deliver!
    save_csv
  end

  def edit_meal(order_to_edit, new_meal)
    order_to_edit.meal = new_meal
    save_csv
  end

  def edit_customer(order_to_edit, new_customer)
    order_to_edit.customer = new_customer
    save_csv
  end

  def edit_employee(order_to_edit, new_employee)
    order_to_edit.employee = new_employee
    save_csv
  end

  def status_edit(order_to_edit, status)
    status == true ? order_to_edit.deliver! : order_to_edit.not_delivered!
  end

  def delete_order(index)
    @elements.delete_at(index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:delivered] = row[:delivered] == "true"
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      @elements << Order.new(row)
    end
    @next_id = @elements.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |row|
      row << ["id", "delivered", "meal_id", "customer_id", "employee_id"]
      @elements.each do |order|
        row << [order.id, order.delivered?, order.meal.id, order.customer.id, order.employee.id]
      end
    end
  end
end
