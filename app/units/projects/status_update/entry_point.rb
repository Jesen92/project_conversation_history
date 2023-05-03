# frozen_string_literal: true

module Projects
  module StatusUpdate
    class EntryPoint
      def initialize(params:, project:)
        params = params
        form = Form.new.call(params)
        @action = Action.new(form: form, project: project)
      end

      def call
        action.call
      end

      private

      attr_reader :action
    end
  end
end
