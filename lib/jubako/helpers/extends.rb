module Jubako::Helpers
  module Extends
    def extends(layout)
      scope = content_for(:jubako_scope)
      content_for("jubako_extend_#{scope}", layout, flush: true)
    end
  end
end
