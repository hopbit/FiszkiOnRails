class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.references :deck, foreign_key: true
      t.text :front
      t.text :back

      t.timestamps
    end
  end
end
