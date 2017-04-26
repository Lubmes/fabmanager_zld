module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "FabLab").join(" - ")
      end
    end
  end

  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end

  def markdown(text)
    options = {
        filter_html:     true,
        hard_wrap:       true,
        link_attributes: { rel: 'nofollow', target: "_blank" },
        space_after_headers: true,
        fenced_code_blocks: true
    }

    extensions = {
        autolink:           true,
        superscript:        true,
        disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
