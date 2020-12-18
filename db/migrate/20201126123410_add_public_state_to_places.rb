class AddPublicStateToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :public_state, :boolean,default: false,null: false
  end
end
