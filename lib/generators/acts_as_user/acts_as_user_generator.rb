module ActsAsUser
  module Generators
    class ActsAsUserGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers

      namespace "acts_as_user"
      desc "Creates a migration for adding the necessary attributes to the user model"

      hook_for :orm
    end
  end
end
