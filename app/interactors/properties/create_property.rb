class CreateProperty
  include Interactor
  
  def call
  	property = Property.new(context.params)
    property.user_id = context.user.id
  	
  	if property.save
      context.property = property
    else
    	context.property = property
    	context.fail!
    end
  end
end