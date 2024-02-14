class PhotosController < ApplicationController
  
  def index
    @list_of_photos = Photo.all.order(:created_at => :desc)
   
    render(template: "photos_templates/index")
  end

  def show

    photo_id_url = params.fetch("path_photo_id")

    photo_record = Photo.where(:id => photo_id_url)

    @photo = photo_record.at(0)

    render(template: "photos_templates/show")
  end

  def destroy

    photo_id_url = params.fetch("path_photo_id")

    photo_record = Photo.where(:id => photo_id_url)

    photo = photo_record.at(0)

    photo.destroy
    
    redirect_to("/photos")

  end

  def create

    @photo = Photo.new
    @photo.image = params.fetch("poster_image")
    @photo.caption = params.fetch("post_caption")
    @photo.owner_id = params.fetch("poster_id")
    if @photo.poster.valid?
      @photo.save
      redirect_to("/photos/#{@photo.id}")
    else
      redirect_to("/photos/#{@photo.id}")
    end
  end

  def update

    the_id = params.fetch("photo_id")
    @the_photo = Photo.find(the_id)

    @the_photo.image = params.fetch("input_image")

    @the_photo.caption = params.fetch("input_caption")

    @the_photo.save

    redirect_to("/photos/#{the_id}")
  end

end
