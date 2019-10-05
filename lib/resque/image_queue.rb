class ImageQueue
    @queue = :image_queue
    def self.perform(image_id)
      image = Image.find image_id
      img.media.with_cover= true
      img.save
      img.media.recreate_versions! :cover
    
    end
  end