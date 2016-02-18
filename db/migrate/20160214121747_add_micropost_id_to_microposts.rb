class AddMicropostIdToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :micropost_id, :integere
  end
end
