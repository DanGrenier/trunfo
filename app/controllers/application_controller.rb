class ApplicationController < ActionController::Base
  include SessionsHelper
	before_action :set_locale



	private
	def set_locale
		I18n.locale = :"en"
	end


end
