class CreateProfile < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true

      t.string :avatar
      t.string :name

      t.timestamps
    end
  end
end

