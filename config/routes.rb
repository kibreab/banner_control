# I defined some routes here
BannerControl::Application.routes.draw do
  root to: 'banner#index'
  get ':controller(/:action)' 
  post ':controller(/:action)' 
  post "/banner" => "banner#create_banner_content"
end
