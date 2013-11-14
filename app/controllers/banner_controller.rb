class BannerController < ApplicationController

 def index
  load
 	render 'index'
 end
	
 def add_banner
 	type = params[:type]
 	#check params[:type] and assign this view to where it should redirect
 	render type == 'content' ? :add_banner_content : :add_banner_slot
 end

 def create_banner_content
    #Here we create a new banner content

	 @banner_content = BannerContent.new  #banner_content object is created

    @banner_content.remote_banner_image_url = params[:banner_image] #This allocates the image in active record and in a file
    @banner_content.title = params[:title] 
    @banner_content.content = params[:content]
    @banner_content.contact = params[:contact]

     begin
       @banner_content.save
     rescue
       raise "exception here" 
     end

    respond_to do |format|
      format.json { render json: @banner_content.to_json}
    end
  end


  def create_banner_slot
    #Here we create a new slot

    # slot parameter example
    #{"name"=>"kibreab tekle awono", "transparency"=>"1", "width"=>"80", "height"=>"67", "date"=>"11/11/2013", "time"=>"19:02:37", 
    # "bgstyle"=>"#7bd148", "bg_id"=>"color" }

    time_to_merge = params[:time].to_time
    date_to_merge = params[:date].to_date

    merged_datetime = DateTime.new(date_to_merge.year, date_to_merge.month,
                               date_to_merge.day, time_to_merge.hour,
                               time_to_merge.min, time_to_merge.sec)
    
    @banner_slot = BannerSlot.new  #banner_content object is created

    @banner_slot.remote_bgimage_url = params[:bgstyle] if (params['bg_id'] == 'image')#This allocates the image in active record and in a file
    @banner_slot.bgcolor = params[:bgstyle] if (params['bg_id'] == 'color') 
    @banner_slot.name = params[:name] 
    @banner_slot.transparency = params[:transparency]
    @banner_slot.width = params[:width]
    @banner_slot.height = params[:height]
    @banner_slot.valid_to = merged_datetime

     begin
       @banner_slot.save
     rescue Exception => e
       raise "exception here" 
     end

    respond_to do |format|
      @banner_slot.valid_to = @banner_slot.valid_to.to_datetime.to_json # I did this because json got confused the format of time db offered 
      format.json { render json: @banner_slot.to_json}
    end
  end

  def link_banner_content_to_slots
    load # I needed this private method inorder to fetch all slots and banners for linking them 
    render 'link_banner_content_to_slots'
  end

  def link_banner_content
    load
    #Here we link banner contents to slots

    # Here's example from parameter
    # Parameters: { "banner_slot_ids"=>["17", "60", "80"], "banner_content_id"=>"76"}
    if Banner.map_content_to_slot(params) # in model I am returning true if data is successfully saved
      flash[:success] = "Successfully linked banner content to banner slot"
    end
    redirect_to '/'
  end

  def list_slots
    load
    render 'list_slots'
  end

	def delete_banner_content
    # This is where we delete the content 
    id = params[:id]
    @banner_content = BannerContent.find(id) 

    begin
       @banner_content.delete
     rescue Exception => e
       raise "exception here" 
    end

    respond_to do |format|
      format.json { render json: {"deletion_succeeded" => "successfully deleted content"}}
    end
  end

  def delete_banner_slot
    # This is where we delete the slot
    id = params[:id]
    @banner_slot = BannerSlot.find(id)

    begin
       @banner_slot.delete
     rescue
       raise "exception here" 
    end

    respond_to do |format|
      format.json { render json: {"deletion_succeeded" =>"successfully deleted banner"}}
    end
  end

  private
  def load
    @banner = Banner.all
    @banner_slot = BannerSlot.all
    @banner_content = BannerContent.all
  end


end
