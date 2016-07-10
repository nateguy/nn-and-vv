class AddRemarksToParty < ActiveRecord::Migration
  def change
    change_table :parties do |t|
      t.text :remarks
    end
  end
end
