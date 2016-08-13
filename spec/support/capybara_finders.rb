module CapybaraFinders
  def tag(content)
    find("div.tag", text: content)
  end

  RSpec.configure do |c|
    c.include CapybaraFinders, type: :feature
  end
end