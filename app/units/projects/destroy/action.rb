# frozen_string_literal: true

module Projects
  module Destroy
    class Action
      def initialize(project:)
        @project = project
      end

      def call
        project.destroy
      end

      private

      attr_reader :project
    end
  end
end
