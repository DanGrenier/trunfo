class PagesController < ApplicationController

  def home 
  end

  def dashboard
  	#If we have some properties setup
  	if any_properties?
  		#But none has been selected
  		if !property_selected?
  			#Get the users to the properties list so they can select one
  			redirect_to properties_path
  		else
  		  dashboard_home
 		  end	
 		  
 		else
 			#No properties are setup
 			first_time_use
 		end

  end


  protected 

  def dashboard_home
  	render 'dashboard'
  end

  def first_time_use 
  	render 'first_time'
  end


end