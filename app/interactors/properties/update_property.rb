class UpdateProperty
	include Interactor

  def call
  	property = context.property
  	property.assign_attributes(context.params)
	  
    if property.save
      context.charge = property
    else
   	  context.charge = property
  	  context.fail!
    end
  end
end