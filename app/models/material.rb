class Material < ApplicationRecord
  has_many :feeds, :dependent => :destroy
  has_many :machines, :through => :feeds

  def full_name
    if name? && thickness?
      "#{name} #{sort} #{thickness}mm"
    elsif name == nil
      sort.capitalize! if sort.start_with?(sort.downcase)
      if thickness?
      "#{sort} #{thickness}mm"
      else
        "#{sort}"
      end
    else
      "#{name} #{sort}"
    end
  end
end