class Fabmoment < ApplicationRecord
  # Main Models
  belongs_to :author, class_name: "User"
  validates :title, length: { in: 4..25 }
  validates :description, length: { minimum: 20 }
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
  attr_accessor :tag_names
  # Fabmoment has many comments
  has_many :comments, dependent: :destroy
  # Fabmoment needs 1 license
  belongs_to :license
  #fabmoment has many pictures
  has_many :pictures, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :pictures
  #fabmoment has many project_files
  has_many :project_files, dependent: :destroy
  accepts_nested_attributes_for :project_files

  acts_as_votable


  def tag_names=(names)
    @tag_names = names
    names.split.each do |name|
      self.tags << Tag.find_or_initialize_by(name: name)
    end
  end

  def self.search(search)
    query = "%#{search.downcase}%"
    if search
      results = self.where('lower(title) LIKE ? or lower(description) LIKE ?', query, query).order(:created_at)
      result_tags = Tag.where('lower(name) LIKE ?', query)
      result_machines = Machine.where('lower(name) LIKE ?', query)
      result_tags.each do |tag|
        results += self.includes(:tags).where(tags: { id: tag.id })
      end
      result_machines.each do |machine|
        results += self.includes(:machines).where(machines: { id: machine.id })
      end
    else
      results = self.all
    end
    results.uniq{|x| x.id}
  end
    # def search(search)
    #   query = "%#{search.downcase}%"
    #   @result = Fabmoment.search('lower(title) LIKE ?', query)
    #           + Fabmoment.search('lower(description) LIKE ?', query) 
    #           + Tag.search('lower(name) LIKE ?', query)
    # end
end
