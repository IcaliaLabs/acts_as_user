module ActsAsUser
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a Acts_as_user initializer in your application"
      class_option :orm
      
      def copy_initializer
        template "acts_as_user.rb", "config/initializers/acts_as_user.rb"
      end

    end
  end
end
