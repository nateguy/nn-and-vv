class AddNamesToGuest < ActiveRecord::Migration
  def change
    change_table :party_guests do |t|
      t.string :last_name
      t.string :first_name
      t.references :party
    end
  end
end
