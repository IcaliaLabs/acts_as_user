require 'rails/generators/active_record'
require 'generators/acts_as_user/orm_helpers'

module ActiveRecord
  module Generators
    class ActsAsUserGenerator < ActiveRecord::Generators::Base
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

      source_root File.expand_path("../templates", __FILE__)
      include ActsAsUser::Generators::OrmHelpers

      def copy_acts_as_user_migration
        if (behavior == :invoke && model_exists?) || (behavior == :revoke && migration_exists?(table_name))
          migration_template "existing_migration.rb", "db/migrate/add_acts_as_user_to_#{table_name}"
        else
          migration_template "migration.rb", "db/migrate/creates_acts_as_user_to_#{table_name}"
        end
      end

     def inject_is_user_content_to_user
       content = %q{ is_user }

      class_path = if namespaced?
        class_name.to_s.split("::")
      else
        [class_name]
      end

      indent_depth = class_path.size - 1
      content = content.split("\n").map { |line| "  " * indent_depth + line } .join("\n") << "\n"
      inject_into_class(model_path, class_path.last, content) if model_exists?
     end

      def generate_model
        invoke "active_record:model", [name], :migration => false unless model_exists? && behavior == :invoke
      end
    end
  end
end
