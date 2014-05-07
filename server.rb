require 'sinatra'
require './expense'

expenses = []
x = 1
amounts = []
total = 0
current = expenses.last

get '/' do
	@expenses = expenses
	@total = total
	erb :index
end

get '/new' do
	item_name = params[:item]
	item_amount = params[:amount]
 	erb :new
end

get '/save' do
	entry = Expense.new x, params[:item], params[:amount]
	expenses << entry
	
	total = total + expenses.last.amount.to_i
	
	@total = total	
	x = x + 1
	redirect to '/'
end

get '/show/:id' do

id = params[:id]
	expenses.each do |x|
		if x.id == id
			break
		else
			current = x
		end
	end

	@current = current
			
	erb :show
end



