# frozen_string_literal: true

module Projects
  module Create
    class Action
      def initialize(form:)
        @form = form
      end

      def call
        Project.create(form.to_h)
      end

      private

      attr_reader :form
    end
  end
end
