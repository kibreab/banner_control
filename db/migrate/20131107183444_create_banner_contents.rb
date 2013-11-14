# I created banner_contents table here
class CreateBannerContents < ActiveRecord::Migration
  def change
    create_table :banner_contents do |t|
  	  t.column :title, :string
  	  t.column :contact, :string
  	  t.column :content, :text
  	  t.column :banner_image, :string
      t.timestamps
    end
  end
end
