class CreatePurchaseOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_options do |t|
      t.references :content, null: false, foreign_key: true
      t.integer :price
      t.string :video_quality

      t.timestamps
    end
  end
end
