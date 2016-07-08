class HomeController < ApplicationController
  def index

  end

  def photos
    @photo_thumbnail_links = Dir.glob("app/assets/images/pages/home/photos/thumbnails/*.jpg").map do |photo_link|
      photo_link.gsub("app/assets/images",'/assets')
    end

    @photo_links = Dir.glob("app/assets/images/pages/home/photos/*.jpg").map do |photo_link|
      original_path = photo_link.gsub("app/assets/images",'/assets')

      link_array = [original_path]
      thumbnail_path =
        photo_link.gsub("app/assets/images",'/assets').gsub("/photos/","/photos/thumbnails/")

      if @photo_thumbnail_links.include?(thumbnail_path)
        link_array.push(thumbnail_path)
      else
        link_array.push(original_path)
      end
      link_array
    end
  end

  def show_photo
    image_path = params[:image_path]
    if request.xhr?
      render partial: 'show_photo',
        layout: false,
        locals: {
          image_path: image_path,
          use_modal_links: true
        }
    end
  end
end
