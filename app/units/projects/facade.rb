# frozen_string_literal: true

module Projects
  class Facade
    include ::Core::Utils::Facade

    # Projects::Facade.create(params: params)
    has_use_case :create, Create::EntryPoint
    has_use_case :update, Update::EntryPoint
    has_use_case :destroy, Destroy::EntryPoint
    has_use_case :status_update, StatusUpdate::EntryPoint
    has_use_case :comment_create, Comments::Create::EntryPoint
    has_use_case :comment_destroy, Comments::Destroy::EntryPoint
  end
end
