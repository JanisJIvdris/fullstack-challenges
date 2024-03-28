# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative "router"
require_relative "app/controllers/meals_controller"
require_relative "app/repositories/meal_repository"
require_relative "app/controllers/customers_controller"
require_relative "app/repositories/customer_repository"
require_relative "app/controllers/sessions_controller"
require_relative "app/repositories/employee_repository"

meal_csv = "data/meals.csv"
customer_csv = "data/customers.csv"
employees_csv = "data/employees.csv"
meal_repo = MealRepository.new(meal_csv)
meal_controller = MealsController.new(meal_repo)
customer_repo = CustomerRepository.new(customer_csv)
customers_controller = CustomersController.new(customer_repo)

employee_repository = EmployeeRepository.new(employees_csv)
sessions_controller = SessionsController.new(employee_repository)

router = Router.new(meal_controller, customers_controller, sessions_controller)

router.run
