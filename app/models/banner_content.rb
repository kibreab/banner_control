class BannerContent < ActiveRecord::Base
	has_many :banners
	has_many :banner_slots, through: :banners
	#For banner image used by carrierwave image uploader gem
	mount_uploader :banner_image, BannerimgUploader
end
