module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "FabLab").join(" - ")
      end
    end
  end

  # In ongebruik na fabmoment policy destroy refactor.
  # Eventueel later weer te gebruiken.
  # def admins_only(&block)
  #   block.call if current_user.try(:admin?)
  # end
end
