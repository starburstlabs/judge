class CreateSports < ActiveRecord::Migration[4.2]
  def change
    create_table :sports do |t|
      t.string :name
      t.integer :category_id
    end
  end
end
