class PropertiesController < ApplicationController
	before_action :assign_property, only: [:show, :edit, :update, :destroy]
	before_action :access_restriction, only:[:show, :edit, :update, :destroy]

	def index 
		@properties = current_user.properties
	end

	def show
	end

	def new
		@property = current_user.properties.new
	end

	def create 
	  result = CreateProperty.call(params: property_params, user: current_user)

    if result.success?
  	  flash[:success] = I18n.t('property.saved')
  	  redirect_to properties_path
    else
      @property = result.property
  	  render action: :new 
    end
	end

	def edit 
	end

	def update 
		result = UpdateProperty.call(property: @property, params: property_params)
		if result.success?
  	  flash[:success] = I18n.t('property.updated')
  	  redirect_to properties_path
    else
      @property = result.property
  	  render action: :edit 
    end
	end

	def destroy 
		#If we destroy the currently selected property
  	#we need to reset it
  	is_current = is_current_property?(@property)
  	if @property.destroy
  		flash[:success] = I18n.t('property.deleted')
  		clear_current_property if is_current
  		redirect_to properties_path
  	else
  		flash[:danger] = I18n.t('property.deleted_failure')
  	end
	end

	def select
    property = Property.find(params[:id])
    set_current_property(property)
    redirect_to root_path
  end




	private 

	def property_params 
		params.require(:property)
		.permit(:description, :address, :address2, 
			      :city, :state, :zip, :property_picture, :remove_picture)
	end

	def assign_property 
		@property = Property.find(params[:id])
	end

	def access_restriction 
		redirect_to(root_path, flash: {danger: (I18n.t :unauthorized_access_resource)}) unless (@property.user == current_user)
	end
end