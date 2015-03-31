class CreateForuns < ActiveRecord::Migration
  def change
    create_table :foruns do |t|

      t.timestamps
    end
  end
end
