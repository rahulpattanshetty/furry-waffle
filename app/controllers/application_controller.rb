class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_api_key
		if params[:api_key]
			@tenant = Tenant.find_by(api_key: params[:api_key])
			if @tenant.nil?
				render 'api/v1/tenants/invalid.json' 
			else
				@tenant.update_attributes(count: @tenant.count +=1)
				return @tenant
			end
		else
			render 'api/v1/tenants/alert.json'
		end
		
	end

end
