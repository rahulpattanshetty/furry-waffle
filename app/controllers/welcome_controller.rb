class WelcomeController < ApplicationController
  def index
	@users = User.all 
	@questions = Question.all 
	@answer = Answer.all  
	@tenants = Tenant.all
  end
end
