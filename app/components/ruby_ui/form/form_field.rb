# frozen_string_literal: true

module RubyUI
  class FormField < Base
    def view_template(&)
      div(**attrs, &)
    end

    private

    def default_attrs
      {
        class: "space-y-2",
        data: { controller: "ruby-ui--form-field" }
      }
    end
  end
end
