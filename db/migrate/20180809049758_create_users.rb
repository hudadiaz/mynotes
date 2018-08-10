class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :google_uid, index: true
      t.json :info

      t.timestamps
    end
  end
end
