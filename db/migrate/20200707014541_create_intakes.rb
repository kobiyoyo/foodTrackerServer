# frozen_string_literal: true

class CreateIntakes < ActiveRecord::Migration[6.0]
  def change
    create_table :intakes do |t|
      t.string :title

      t.timestamps
    end
  end
end
