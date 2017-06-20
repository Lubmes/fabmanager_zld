class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Avatar
  has_attached_file :avatar, :default_url => '/images/Blank_person.png'
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/, /jpg\Z/]
  validates_presence_of :username
  after_create :send_admin_mail

  # Machine occupier.
  has_one :usage_duration

  scope :excluding_archived, lambda { where(archived_at: nil) }

  def archive
    self.update(archived_at: Time.now)
  end

  def active_for_authentication?
    super && archived_at.nil?
  end

  def inactive_message
    archived_at.nil? ? super : :archived
  end

  def send_admin_mail
      EventsMailer.user_register(self).deliver!
  end
end