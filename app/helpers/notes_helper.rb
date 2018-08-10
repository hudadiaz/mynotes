module NotesHelper
  def render_markdown text
    renderer.render(text.to_s).html_safe
  end

  private

  class CustomTableRenderer < Redcarpet::Render::HTML
    def table(header, body)
      "<table class='table table-bordered w-auto'>" \
        "<thead>#{header}</thead>" \
        "<tbody>#{body}</tbody>" \
      "</table>"
    end
  end

  def renderer
    @@markdown ||= Redcarpet::Markdown.new(CustomTableRenderer,
                                           autolink: true,
                                           disable_indented_code_blocks: true,
                                           fenced_code_blocks: true,
                                           footnotes: true,
                                           lax_spacing: true,
                                           no_intra_emphasis: true,
                                           prettify: true,
                                           quote: true,
                                           strikethrough: true,
                                           superscript: true,
                                           tables: true,
                                           underline: true)
  end
end
