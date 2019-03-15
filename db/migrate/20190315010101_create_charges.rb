class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.string :description
      t.references :user, foreign_key: true
      t.references :merchant, foreign_key: true

      t.timestamps
    end
  end
end
