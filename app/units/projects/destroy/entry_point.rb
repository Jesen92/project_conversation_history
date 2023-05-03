# frozen_string_literal: true

module Projects
  module Destroy
    class EntryPoint
      def initialize(project:)
        @action = Action.new(project:)
      end

      def call
        action.call
      end

      private

      attr_reader :action
    end
  end
end
