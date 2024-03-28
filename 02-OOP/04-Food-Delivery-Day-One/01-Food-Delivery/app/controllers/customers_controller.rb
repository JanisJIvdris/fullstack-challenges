require_relative "../models/customer"
require_relative "../views/customer_view"

class CustomersController
  def initialize(customer_repo)
    @customer_repo = customer_repo
    @customer_view = CustomerView.new
  end

  def add
    name = @customer_view.ask_for("name")
    address = @customer_view.ask_for("address")
    new_customer = Customer.new({ name: name, address: address })
    @customer_repo.create(new_customer)
  end

  def edit
    list
    index = @customer_view.ask_to_edit.to_i - 1
    customer_to_edit = @customer_repo.all[index]
    new_name = @customer_view.ask_for_new("name")
    new_address = @customer_view.ask_for_new("address")
    customer_to_edit.name = new_name
    customer_to_edit.address = new_address
    @customer_repo.save_csv
  end

  def destroy
    list
    index = @customer_view.ask_to_delete.to_i - 1
    @customer_repo.all.delete_at(index)
    @customer_repo.save_csv
  end

  def list
    customers = @customer_repo.all
    @customer_view.display_list(customers)
  end
end
