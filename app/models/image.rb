class Image < ApplicationRecord
  belongs_to :record, :polymorphic => true
  #mount_uploader :name, AvatarUploader
end
