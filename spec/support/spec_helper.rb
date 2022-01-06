# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

def require_all(dir)
  Dir["#{File.expand_path(File.join(File.dirname(File.absolute_path(__FILE__)), dir))}/**/*.rb"].each do |file|
    require file
  end
end

require_all '../../lib'
