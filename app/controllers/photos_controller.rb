class PhotosController < ApplicationController

  def index

    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "photo_templates/index.html.erb"})
  end

  def show

    #Parameters: {"path_photo"=>"777"}
    url_photo = params.fetch("path_photo")
    matching_photos = Photo.where({ :id => url_photo})
    @the_photo = matching_photos.at(0)


    render({ :template => "photo_templates/show.html.erb"})
  end

  def delete

    #Parameters: {"path_photo"=>"916"}
    the_id = params.fetch("path_photo")
    matching_photos = Photo.where({ :id => the_id})
    @the_photo = matching_photos.at(0)

    @the_photo.destroy

    #render({ :template => "photo_templates/delete.html.erb"})
    redirect_to("/photos")

  end
  

  def create

    #Parameters: {"query_image"=>"https://www.chicagobooth.edu/-/media/project/chicago-booth/phd/chicago-booth-phd-students.jpg?cx=0.67&cy=0.36&cw=940&ch=749&hash=30D2BAB79B1274B6D4D96A4F00C2A7BF", "query_caption"=>"Chicago Booth Faculty", "query_owner_id"=>"117"}
  input_image = params.fetch("query_image")
  input_caption = params.fetch("query_caption")
  input_owner_id = params.fetch("query_owner_id")

  a_new_photo = Photo.new

  a_new_photo.image = input_image
  a_new_photo.caption =input_caption
  a_new_photo.owner_id =input_owner_id

  a_new_photo.save

    #render({ :template => "photo_templates/create.html.erb"})
    redirect_to("/photos/" + a_new_photo.id.to_s)
  end

end