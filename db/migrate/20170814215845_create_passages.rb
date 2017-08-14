class CreatePassages < ActiveRecord::Migration[5.1]
  def change
    create_table :passages do |t|
      t.text :text, null: false
      t.string :reference, null: false, unique: true

      t.timestamps
    end
  end
end
