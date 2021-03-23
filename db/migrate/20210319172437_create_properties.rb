class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
    	t.references :user, foreign_key: true 
    	t.string :description , null: false 
    	t.string :address
    	t.string :address2
    	t.string :city
    	t.string :state
    	t.string :zip
      t.timestamps
    end
  end
end
