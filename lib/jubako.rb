require "jubako/engine"
require "jubako/renderer"
require "jubako/helpers/rendering"
require "jubako/helpers/extends"
require "jubako/helpers/block"

ActionView::Base.send(:include, Jubako::Helpers::Rendering)
ActionView::Base.send(:include, Jubako::Helpers::Extends)
ActionView::Base.send(:include, Jubako::Helpers::Block)

ActionView::Renderer.send(:include, Jubako::Renderer)
