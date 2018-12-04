class CreatePastHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :past_histories do |t|
      t.references :recipe, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
