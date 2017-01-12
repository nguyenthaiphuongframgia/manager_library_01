class CreatePublishers < ActiveRecord::Migration[5.0]
  def change
    create_table :publishers do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone
      t.text :description

      t.timestamps
    end
  end
end
