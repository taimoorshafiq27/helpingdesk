# frozen_string_literal: true

class ToolbarComponent < ViewComponent::Base
  def initialize(title:)
    @title = title
  end
end
