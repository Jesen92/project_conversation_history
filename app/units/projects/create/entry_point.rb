# frozen_string_literal: true

module Projects
  module Create
    class EntryPoint
      def initialize(params:)
        params = params
        form = Form.new.call(params)
        @action = Action.new(form: form)
      end

      def call
        action.call
      end

      private

      attr_reader :action
    end
  end
end
