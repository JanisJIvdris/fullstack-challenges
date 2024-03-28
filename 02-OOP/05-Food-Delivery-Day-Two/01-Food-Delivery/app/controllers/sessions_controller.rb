require_relative "../views/session_view"

class SessionsController
  def initialize(employee_repo)
    @employee_repo = employee_repo
    @login_view    = SessionView.new
  end

  def login
    username = @login_view.ask_for("username")
    password = @login_view.ask_for("password")
    current_user = @employee_repo.find_by_username(username)
    if current_user && current_user.password == password
      @login_view.welcome_message(username.capitalize)
      return current_user
    else
      login
    end
  end
end
