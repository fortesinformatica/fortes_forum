class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :reply, index: true
      t.belongs_to :user, index: true
      t.text :conteudo

      t.timestamps
    end
  end
end
