class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :restaurant, foreign_key: true
      t.string :reviewer_name
      t.string :reviewer_email
      t.text :review

      t.timestamps
    end
  end
end
