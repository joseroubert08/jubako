module Jubako
  module Renderer
    def jubako_renderer(layout, locals = {})
      extends = content_for(:jubako_extend_layout)
      layout  = layout.call if layout.is_a?(Proc)
      args    = { locals: locals }

      content_for(:jubako_extend_layout, '', flush: true)

      if layout.nil?
        if extends.nil?
          return yield
        else
          args[:template] = extends
        end
      else
        if extends.nil?
          args[:template] = layout
        else
          args[:template] = extends
          args[:layout]   = layout
        end
      end

      render(args)
    end
  end
end
