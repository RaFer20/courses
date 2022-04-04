def prompt(text)
  puts "--- #{text}"
end

def valid_input?(input)
  input.to_f > 0 && input.empty? == false
end

loop do
  prompt("Welcome to the Car Loan Calculator!")
  prompt("What is the loan amount?")
  loan_amount = ''

  loop do
    loan_amount = gets.chomp
    break if valid_input?(loan_amount)
    prompt("Your loan amount must be a positive number!")
  end

  prompt("What is your interest rate?")
  prompt("Enter 5 for 5%, 2.5 for 2.5%")
  interest_rate = ''

  loop do
    interest_rate = gets.chomp
    break if valid_input?(interest_rate)
    prompt("Your interest rate must be a positive number!")
  end

  prompt("What is the loan duration in years?")
  loan_duration_years = ''

  loop do
    loan_duration_years = gets.chomp
    break if valid_input?(loan_duration_years)
    prompt("Please enter a positive number for the loan duration.")
  end

  monthly_interest_rate = interest_rate.to_f / 100 / 12
  loan_duration_months = loan_duration_years.to_i * 12

  monthly_payment = loan_amount.to_f *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))

  prompt("Your monthly payment is: $#{monthly_payment.round(2)}")
  prompt("-------------------------------------------")
  prompt("Would you like to make another calculation?")
  another_calculation = gets.chomp.downcase
  break unless another_calculation.start_with?('y')
end

prompt("Thank you for using the car loan calculator!")