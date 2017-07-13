class CreateGazooies < ActiveRecord::Migration[5.1]
  def change
    create_table :gazooys do |t|
      t.belongs_to :user
      t.string :text
      t.integer :reply_to_id

      t.timestamps
    end
  end
end
