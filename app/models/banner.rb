class Banner < ActiveRecord::Base
	belongs_to :banner_slot
	belongs_to :banner_content

	def self.map_content_to_slot(params)
		#Here I populate the banners table with the association 
		slot_ids = params["banner_slot_ids"]
		content = BannerContent.find(params["banner_content_id"])

		slot_ids.each do |slot_id|
			begin
				slot = BannerSlot.find(slot_id)
				create(banner_slot:slot, banner_content:content)
				return true
			rescue Exception => e
			end
		end
		
	end
end
