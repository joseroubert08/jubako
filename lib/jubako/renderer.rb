module Jubako
  module Renderer
    extend ActiveSupport::Concern

    included do
      alias_method_chain :render_template, :jubako
      alias_method_chain :render_partial, :jubako
    end

    def render_template_with_jubako(context, options)
      jubako_scoped(context, options) do
        render_template_without_jubako(context, options)
      end
    end

    def render_partial_with_jubako(context, options, &block)
      jubako_scoped(context, options) do
        render_partial_without_jubako(context, options, &block)
      end
    end

    private

    def jubako_scoped(ctx, opts)
      old_scope = ctx.content_for(:jubako_scope)
      new_scope = old_scope
      new_scope = SecureRandom.hex(8) unless opts[:jubako]

      opts[:locals] ||= {}
      opts[:locals]["jubako_layout_#{new_scope}"] = opts[:layout]
      opts[:layout] = 'layout/jubako'

      ctx.content_for(:jubako_scope, new_scope, flush: true)
      ret = yield(new_scope)
      ctx.content_for(:jubako_scope, old_scope || '', flush: true)

      ret
    end
  end
end
