class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :name, null: false
      t.text :description
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
