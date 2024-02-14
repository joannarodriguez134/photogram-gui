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

end
