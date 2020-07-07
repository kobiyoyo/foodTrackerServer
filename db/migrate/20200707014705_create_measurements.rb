class CreateMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :measurements do |t|
      t.references :user, null: false, foreign_key: true
      t.references :intake, null: false, foreign_key: true
      t.integer :units

      t.timestamps
    end
  end
end
