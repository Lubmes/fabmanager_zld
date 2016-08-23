class Fabmoment < ApplicationRecord
  belongs_to :author, class_name: "User"
  validates :title, presence: true
  validates :description, presence: true
  # Fabmoment to interface with programs. 
  has_many :interfaces, :dependent => :destroy
  has_many :programs, :through => :interfaces
  # Fabmoment to handle machines. 
  has_many :handles, :dependent => :destroy
  has_many :machines, :through => :handles
  # Fabmoment to feed materials.
  has_many :feeds, :dependent => :destroy
  has_many :materials, :through => :feeds
  # Fabmoment has many tags (and vice versa).
  has_and_belongs_to_many :tags, uniq: true
  
  # Multiple file uploads of images possible.
  mount_uploaders :images, ImageUploader
  # Multiple file uploads of project files possible.
  mount_uploaders :project_files, ProjectFileUploader

  attr_accessor :tag_names

  def tag_names=(names)
    @tag_names = names
    names.split.each do |name|
      self.tags << Tag.find_or_initialize_by(name: name)
    end
  end
end
