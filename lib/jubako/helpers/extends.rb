module Jubako::Helpers
  module Extends
    def extends(layout)
      content_for(:jubako_extend_layout, layout, flush: true)
    end
  end
end
