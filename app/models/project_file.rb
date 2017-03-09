class ProjectFile < ApplicationRecord
	belongs_to :fabmoment

	has_attached_file :file,
		:path => ":rails_root/public/uploads/:id/:filename",
		:url => "/uploads/:id/:filename"

	do_not_validate_attachment_file_type :file
end
