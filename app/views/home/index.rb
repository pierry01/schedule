# frozen_string_literal: true

module Views
  module Home
    class Index < Views::Base
      def view_template
        Heading { "FOO" }
        Text { "BAR" }
      end
    end
  end
end
