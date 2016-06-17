class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :email
      t.string :phone
      t.string :address

      t.string :reference_code

      t.timestamps
    end
  end
end
