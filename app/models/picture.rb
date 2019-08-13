# frozen_string_literal: true

class Picture < ApplicationRecord
    belongs_to :article
    mount_uploader :image, PictureUploader
end
