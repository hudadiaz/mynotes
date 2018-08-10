class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.references :user
      t.string :slug, index: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
