class CreateGivePage < ActiveRecord::Migration
  def change
    create_table :give_pages do |t|
      t.text :title
      t.text :description
      t.text :publicBTC
      t.text :privateBTC
      t.references :user, index: true
    end
  end
end
