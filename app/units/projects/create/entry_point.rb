# frozen_string_literal: true

module Projects
  module Create
    class EntryPoint
      def initialize(params:)
        form = Core::Forms::ProjectsForm.new.call(params)
        @action = Action.new(form:)
      end

      def call
        action.call
      end

      private

      attr_reader :action
    end
  end
end
