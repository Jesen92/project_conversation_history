# frozen_string_literal: true

module Projects
  module Destroy
    class EntryPoint
      ProjectHasHistory = Class.new(StandardError)

      def initialize(project:)
        @project = project
        @action = Action.new(project:)
      end

      def call
        deletable? project

        action.call
      end

      private

      attr_reader :action, :project

      def deletable?(project)
        raise ProjectHasHistory if project.activities.present?
      end
    end
  end
end
