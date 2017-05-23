class Picture < ApplicationRecord
	belongs_to :imageable, polymorphic: true

	has_attached_file :image, :path => ":rails_root/public/images/:id/:filename", :url => "/images/:id/:filename"

	# do_not_validate_attachment_file_type :image
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/, :message => 'file type is not allowed (only jpeg/png/gif images)'
	# validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/, :message => 'file type is not allowed (only jpeg/png/gif images)'
	# validates_attachment_content_type :image, :content_type => /\Aimage/
  # validates_attachment_file_name :image, :matches => [ /png\Z/, /jpe?g\Z/ ]
end
