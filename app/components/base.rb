# frozen_string_literal: true

class Components::Base < Phlex::HTML
  include Components
  include RubyUI

  include Phlex::Rails::Helpers::Routes
  include Phlex::Rails::Helpers::FormWith

  if Rails.env.development?
    def before_template
      comment { "Before #{self.class.name}" }
      super
    end
  end
end
