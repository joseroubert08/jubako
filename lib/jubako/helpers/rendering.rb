module Jubako::Helpers
  module Rendering
    def jubako_renderer(locals = {})
      scope   = content_for(:jubako_scope)
      extends = content_for("jubako_extend_#{scope}")

      layout  = locals["jubako_layout_#{scope}"]
      layout  = layout.call if layout.is_a?(Proc)

      args    = { locals: locals, jubako: true }

      if layout
        if extends
          args[:template] = extends
          args[:layout]   = layout
        else
          args[:template] = layout
        end
      else
        if extends
          args[:template] = extends
        else
          return yield
        end
      end

      content_for("jubako_extend_#{scope}", '', flush: true)
      render(args)
    end
  end
end
