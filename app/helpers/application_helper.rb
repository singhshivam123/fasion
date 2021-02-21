# frozen_string_literal: true

# :nodoc:
module ApplicationHelper
  def current_class?(root_path)
    request.path == root_path ? 'active' : ''
  end
end
