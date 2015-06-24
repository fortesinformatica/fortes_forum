class AddModeradoToComment < ActiveRecord::Migration
  def change
    add_column :comments, :moderado, :boolean, default: :false
  end
end
