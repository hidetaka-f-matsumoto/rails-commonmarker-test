class Document < ApplicationRecord
  before_save -> { self.html = CommonMarker.render_html(markdown, :DEFAULT) }
end
