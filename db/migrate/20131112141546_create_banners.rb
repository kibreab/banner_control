# I created banners table and defined the table relationship in respective models
class CreateBanners < ActiveRecord::Migration
  def self.up
    create_table :banners do |t|
      t.column :banner_content_id, :integer
  	  t.column :banner_slot_id, :integer
      t.timestamps
    end
  end

  def self.down
  	drop_table :banners
  end
end
