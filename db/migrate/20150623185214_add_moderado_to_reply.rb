class AddModeradoToReply < ActiveRecord::Migration
  def change
    add_column :replies, :moderado, :boolean, default: :false
  end
end
