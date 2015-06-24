class AddModeradoToPost < ActiveRecord::Migration
  def change
    add_column :posts, :moderado, :boolean, default: :false
  end
end
