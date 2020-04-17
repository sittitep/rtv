class CreatePurcahseItems < ActiveRecord::Migration[6.0]
  def change
    create_table :purcahse_items do |t|
      t.references :purchase, null: false, foreign_key: true
      t.references :purchase_option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
