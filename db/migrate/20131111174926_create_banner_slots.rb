# I created banner slots table here
class CreateBannerSlots < ActiveRecord::Migration
  def change
    create_table :banner_slots do |t|
      t.column :name, :string
  	  t.column :bgimage, :string
  	  t.column :bgcolor, :string
  	  t.column :width, :integer
  	  t.column :height, :integer
  	  t.column :transparency, :integer
  	  t.column :valid_to, :datetime
      t.timestamps
    end
  end
end