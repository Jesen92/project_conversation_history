# frozen_string_literal: true

module Projects
  module Update
    class EntryPoint
      def initialize(params:, project:)
        form = Core::Forms::ProjectsForm.new.call(params)
        @action = Action.new(form:, project:)
      end

      def call
        action.call
      end

      private

      attr_reader :action
    end
  end
end
