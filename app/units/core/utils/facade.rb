# frozen_string_literal: true

module Core
  module Utils
    module Facade
      extend ActiveSupport::Concern

      included do |base|
        base.extend Dry::Container::Mixin
      end

      module ClassMethods
        private

        def has_use_case(name, unit_class)
          register(name) { unit_class }
          define_singleton_method(name) { unit_class }
        end
      end
    end
  end
end
