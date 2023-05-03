# frozen_string_literal: true

module Core
  module Forms
    class BaseForm < Dry::Validation::Contract
      def call params
        valid! super(params.to_h) 
      end

      private

      def valid! form
        return form if form.errors.empty?

        raise Exceptions::ValidationError.new(params: form)
      end
    end
  end
end
