class CreateReply < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.belongs_to :post, index: true
      t.text :conteudo
      t.belongs_to :user, index: true
    end
  end
end
