class ImageSerializer < ActiveModel::Serializer
  attributes :_id,:media_filename,:updated_at,:created_at,:deleted_at
end
