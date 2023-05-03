# frozen_string_literal: true

module Projects
  class Facade
    include ::Core::Utils::Facade

    # Projects::Facade.create(params: params) 
    has_use_case :create, Create::EntryPoint
    has_use_case :update, Update::EntryPoint
    has_use_case :destroy, Destroy::EntryPoint
  end
end
