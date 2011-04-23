module FilmsHelper
  def show_video(url)
    content_tag(:iframe,nil,:width=>"480",:height=>"390",:src=>"http://www.youtube.com/embed/#{url}",:frameborder=>0,:allow_fullscreen=>true)
  end
end
