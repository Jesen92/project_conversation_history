# frozen_string_literal: true

module Projects
  module Comments
    module Create
      class EntryPoint
        def initialize(params:, current_user:)
          form = Form.new.call(params)
          @action = Action.new(form:, current_user:)
        end

        def call
          action.call
        end

        private

        attr_reader :action
      end
    end
  end
end
