class Api::V1::TenantsController < ApplicationController
before_action :check_api_key
def index
	
	if params[:query]
	
		@questions = Question.where('private == ? AND title LIKE ?',false,"%#{params[:query]}%")
		render json: {question: @questions.map{|question| question.attributes.merge(answer:question.answers.map{|answer| answer.attributes.merge(user_name:answer.user.name)})}}
	else
		@questions = Question.where('private == ?',false)
		render json: {question: @questions.map{|question| question.attributes.merge(answer:question.answers.map{|answer| answer.attributes.merge(user_name:answer.user.name)})}}

	end
end

end
