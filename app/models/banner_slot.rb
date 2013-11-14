class BannerSlot < ActiveRecord::Base
	has_many :banners
	has_many :banner_contents, through: :banners

	#For banner Background image we are using carrierwave gem to save image in db and file
	mount_uploader :bgimage, BannerimgUploader
end
