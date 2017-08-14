class AddIndexToReference < ActiveRecord::Migration[5.1]
  def change
    add_index(:passages, :reference)
  end
end
