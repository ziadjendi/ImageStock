class ImageUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick    
    #include CarrierWave::ImageOptimizer
    
    #process :optimize
    #process :quality => 100
    #The storage type for this Uploader:
    storage :file
    # Override the directory where uploaded files will be stored.
    def store_dir
      "uploads/images"
    end

    #The white list of extensions that allowed to upload
    def extension_white_list
        %w(png jpg jpeg gif)
    end

    version :thumb do
        process :resize_to_fit => [100, 100]
        process :convert => 'jpg'
      end
      
      version :cover, :if => :with_cover? do
        process :resize_to_fit => [240, 180]
        process :convert => 'jpg'
      end
      
      def with_cover?(img = nil)
        @with_cover
      end
      
      def with_cover=(value)
        @with_cover = value
      end
  end