# frozen_string_literal: true

module Projects
  module StatusUpdate
    class EntryPoint
      def initialize(params:, project:, current_user:)
        form = Form.new.call(params)
        @action = Action.new(form: form, project: project, current_user: current_user)
      end

      def call
        action.call
      end

      private

      attr_reader :action
    end
  end
end
