module Jubako
  module TemplateRenderer
    extend ActiveSupport::Concern

    included do
      alias_method_chain :render_template, :jubako
    end

    def render_template_with_jubako(template, layout_name = nil, locals = nil)
      locals ||= {}
      locals[:jubako_original_layout] = layout_name

      layout_name = find_layout('layout/jubako', locals.keys)
      render_template_without_jubako(template, layout_name, locals)
    end
  end
end
