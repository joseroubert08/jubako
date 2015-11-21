require "jubako/engine"
require "jubako/renderer"
require "jubako/template_renderer"
require "jubako/helpers/extends"
require "jubako/helpers/block"

ActionView::TemplateRenderer.send(:include, Jubako::TemplateRenderer)
ActionView::Base.send(:include, Jubako::Renderer)
ActionView::Base.send(:include, Jubako::Helpers::Extends)
ActionView::Base.send(:include, Jubako::Helpers::Block)
