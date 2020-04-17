# frozen_string_literal: true

class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.references :resource, polymorphic: true, null: false

      t.timestamps
    end
  end
end
