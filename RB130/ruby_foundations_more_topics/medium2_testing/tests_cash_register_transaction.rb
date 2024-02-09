=begin
1.
Let's start things from the ground up. We want to make a simple test suite for our CashRegister class.
Setup the initial testing file. You don't have to have any tests in your test file.
For this exercise, write everything you would need to start testing CashRegister,
excluding the tests themselves (necessary requires, test class, etc.).

2.
We now have the foundation of our CashRegister test class set up.
Let's start testing! We'll start with the CashRegister#accept_money method.
Write a test for the #accept_money method.

3. 
Write a test for the method, CashRegister#change.

4.
Write a test for method CashRegister#give_receipt that ensures it displays a valid receipt.

5.
Write a test that verifies that Transaction#prompt_for_payment sets the amount_paid correctly. 
=end
require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(50)
    @transaction.amount_paid = 60
  end

  def test_accept_money
    previous_amount = @register.total_money
    @register.accept_money(@transaction)
    current_amount = @register.total_money

    assert_equal previous_amount + 60, current_amount
  end

  def test_change
    assert_equal(10, @register.change(@transaction))
  end

  def test_give_receipt
    output = "You've paid $#{@transaction.item_cost}.\n"

    assert_output(output) {@register.give_receipt(@transaction)}
  end
end

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(50)
    input = StringIO.new('50\n')
    output = StringIO.new  # changes made in `transaction.rb` too
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal(50, transaction.amount_paid)
  end
end