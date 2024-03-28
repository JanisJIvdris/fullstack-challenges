class VendingMachine
  # TODO: add relevant getter/setter to this class to make the scenarios work properly.

  def initialize(snack_price_cents, snack_count)
    @user_balance_cents = 0
    @snack_count = snack_count
    @snack_price_cents = snack_price_cents
  end
  attr_accessor :snack_count, :user_balance_cents
  attr_reader :snack_price_cents

  def insert_coin(input_cents)
    # TODO: what happens to @snack_count, @user_balance_cents and @snack_price_cents
    # when the user inserts a coin?
    @user_balance_cents += input_cents
  end

  def buy_snack
    # TODO: what happens to @snack_count, @user_balance_cents and @snack_price_cents
    # when the user pushes a button to buy a Snack?
    if @snack_count >= 1 && @user_balance_cents >= @snack_price_cents
      @snack_count = snack_count - 1
      @user_balance_cents -= snack_price_cents
    else
      puts "Sorry, bruv issa error"
    end
  end
end

my_machine = VendingMachine.new(8, 10)

puts "Vending machine test: snack price- #{my_machine.snack_price_cents}, snack count - #{my_machine.snack_count}"
