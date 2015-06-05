require 'awesome_print'
class BankAccount
	attr_reader :balance # sets reading for variable 
	# attr_accessor :balance // sets reading and writing for variable

	class << self
		def create_for(first_name, last_name)
			@accounts ||= []
			@accounts << BankAccount.new(first_name, last_name)
		end

		def find_for(first_name, last_name)
			@accounts.find{|account| account.full_name == "#{first_name} #{last_name}"} # finds first name and last name using the full_name method
		end
	end
	
	#def self.create_for(first_name, last_name)
	#	@accounts ||= []
	#	@accounts << BankAccount.new(first_name, last_name)
	#end

	#def self.find_for(first_name, last_name)
	#	@accounts.find{|account| account.full_name == "#{first_name} #{last_name}"} # finds first name and last name using the full_name method
	#end

	def initialize(first_name, last_name) #instantiate classes with arguments first_name and last_name and create instance variable balance because it changes
		@balance = 0
		@first_name = first_name #first name and last name instance variable set equal to the first_name and last name arguments that we pass in 
		@last_name = last_name
	end
	# now when we create  BankAccount instance, it should be set with a balance=0 and the variables first_name and last name 


	def full_name #create this method so that I can return it on an instance of a method
		"#{@first_name} #{@last_name}"
	end

	def deposit(amount)
	@balance += amount	
	end

	def withdraw(amount)
		@balance -= amount	
	end

	# old way to return balance
	#def balance
	#	@balance # returns the balance
	#end

	def call_the_reset_method #internally call teh private reset! method
		reset!
	end

	def reset_other_balance(other_account)  #added protected_reset, private_reset and public reset_other_balance method to check how to call both using this method
		other_account.protected_reset! #change this one to protected_reset! and  run the command to change other account balance and it will work
	end

	private # make this method(s) below private 

	def reset! # resets balance to 0
		@balance = 0
	end

	def private_reset!
		@balance = 0 
	end

	protected

	def protected_reset!
		@balance = 0
	end
	
end

#command line

# WITH INSTANCE METHODS
# irb
# .load './bank_account.rb'
# bank_account = BankAccount.new("Mohammed", "Rashid")
# ap bank_account.inspect

#INTRODUCING CLASS METHODS
# irb
# .load './bank_account.rb'
# BankAccount.create_for("Mohammed", "Rashid") // returns array inside the bank_account class 
# BankAccount.create_for("Mike", "The frog") // create anohter instance 
# Create as many as you like
# Go into Any one of the accounts using find_for and deposit using bank_account.deposit(100) for that account
# bank_account.balance 

#INTRODUCING METHOD VISIBILITY
# irb
# .load './bank_account.rb'
#  bank_account.reset! // need to make this method private because it could be dangerouse, create another method call_the_reset_method
# .load './bank_account.rb'
#  bank_account.call_the_reset_method // after creating the method, use this instead
#  account1 = BankAccount.new("Jason", "Seifer") // create two accounts to test protected method
#  account2 = BankAccount.new("Mike", "The Frog")
#  account1.reset_other_balance(account2) // run this after changing to protected in public method  def reset_other_balance(other_account) and it will work