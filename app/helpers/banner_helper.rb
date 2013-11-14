module BannerHelper
	def defined_colors
		#Here i am going to define few colors of my choice, the app can be extended of course by may be using gems for more power
		[["Green","#7bd148"], ["Bold blue", "#5484ed"],["Blue","#a4bdfc"],["Turquoise","#46d6db"],["Light green","#7ae7bf"],["Bold green","#51b749"],["Yellow","#fbd75b"],
		["Orange","#ffb878"],["Red","#ff887c"],["Bold red","#dc2127"],["Purple","#dbadff"],["Gray","#e1e1e1"]]
	end

	# Needed this helper method in order to check weather passed time is before or after today
	def expired? valid_to
		valid_to.to_time < Time.now
	end
end
