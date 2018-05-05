class Image < ApplicationRecord
  belongs_to :record, :polymorphic => true,  optional: true
  mount_uploader :name, ImageUploader
end
