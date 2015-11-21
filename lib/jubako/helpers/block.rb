module Jubako::Helpers
  module Block
    def block(body = nil, append: nil, prepend: nil, &block)
      name = body || append || prepend

      if content_for?(body_name(name))
        return render_block(name)
      else
        content = block_given? ? capture(&block) : ''
        ret     = render_block(name, content)

        if block_given?
          if !body.nil?
            replace_body(name, content)
          elsif !append.nil?
            add_append(name, content)
          elsif !prepend.nil?
            add_prepend(name, content)
          end
        end

        ret
      end
    end

    private

    def render_block(name, body = nil)
      capture do
        concat content_for(prepend_name(name))
        concat body.nil? ? content_for(body_name(name)) : body
        concat content_for(append_name(name))
      end
    end

    def body_name(name)
      "jubako_block_body__#{name}"
    end

    def replace_body(name, body)
      content_for(body_name(name), body, flush: true)
    end

    def append_name(name)
      "jubako_block_append__#{name}"
    end

    def add_append(name, body)
      content_for(append_name(name), body)
    end

    def prepend_name(name)
      "jubako_block_prepend__#{name}"
    end

    def add_prepend(name, body)
      replaced_body = capture do
        concat body
        concat content_for(prepend_name(name))
      end
      content_for(prepend_name(name), replaced_body, flush: true)
    end
  end
end
