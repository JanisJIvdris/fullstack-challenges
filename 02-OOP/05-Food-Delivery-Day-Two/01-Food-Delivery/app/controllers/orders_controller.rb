require_relative "../models/order"
require_relative "../views/order_view"
require_relative "../views/meal_view"
require_relative "../views/customer_view"
require_relative "../views/session_view"

class OrdersController
  def initialize(meal_repo, customer_repo, employee_repo, order_repo)
    @order_repo = order_repo
    @meal_repo = meal_repo
    @employee_repo = employee_repo
    @customer_repo = customer_repo
    @order_view = OrderView.new
    @meal_view = MealView.new
    @employee_view = SessionView.new
    @customer_view = CustomerView.new
  end

  def add
    @meal_view.display_list(@meal_repo.all)
    meal = @meal_repo.all[@meal_view.ask_for_meal]
    @customer_view.display_list(@customer_repo.all)
    customer = @customer_repo.all[@customer_view.ask_for_customer]
    @employee_view.display_riders(@employee_repo.all_riders)
    employee = @employee_repo.all_riders[@employee_view.ask_for_rider]
    new_order = Order.new({ meal: meal, customer: customer, employee: employee })
    @order_repo.create(new_order)
  end

  def mark_as_delivered(employee)
    list_my_orders(employee)
    index = @order_view.ask_to_mark
    orders = @order_repo.undelivered_orders
    rider_orders = orders.select { |order| order.employee.username == employee.username }
    delivered_order = rider_orders[index]
    @order_repo.mark_delivered(delivered_order)
  end

  def list_my_orders(employee)
    orders = @order_repo.undelivered_orders
    rider_orders = orders.select { |order| order.employee.username == employee.username }
    @order_view.display_orders(rider_orders)
  end

  def edit
    list
    index = @order_view.ask_to_edit
    order_to_edit = @order_repo.all[index]
    action = @order_view.what_to_edit
    case action
    when :meal then edit_meal(action, order_to_edit)
    when :customer then edit_customer(action, order_to_edit)
    when :employee then edit_employee(action, order_to_edit)
    when :delivered then edit_delivered(order_to_edit)
    end
  end

  def edit_meal(action, order_to_edit)
    @meal_view.display_list(@meal_repo.all)
    new_meal = @meal_repo.all[@order_view.ask_for_new("meal")]
    @order_repo.edit_meal(order_to_edit, new_meal)
  end

  def edit_customer(action, order_to_edit)
    @customer_view.display_list(@customer_repo.all)
    new_customer = @customer_repo.all[@order_view.ask_for_new("customer")]
    @order_repo.edit(order_to_edit, action, new_customer)
  end

  def edit_employee(action, order_to_edit)
    @employee_view.display_riders(@employee_repo.all_riders)
    new_rider = @employee_repo.all_riders[@order_view.ask_for_new("rider")]
    @order_repo.edit(order_to_edit, action, new_rider)
  end

  def edit_delivered(order_to_edit)
    status = @order_view.delivered?
    @order_repo.status_edit(order_to_edit, status)
  end

  def destroy
    list
    index = @order_view.ask_to_delete
    @order_repo.delete_order(index)
  end

  def list
    orders = @order_repo.all
    @order_view.display_orders(orders)
  end

  def list_undelivered_orders
    orders = @order_repo.undelivered_orders
    @order_view.display_orders(orders)
  end
end
