require 'rails/generators/active_record'
require 'generators/acts_as_user/orm_helpers'

module ActiveRecord
  module Generators
    class ActsAsUserGenerator < ActiveRecord::Generators::Base
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

      source_root File.expand_path("../templates", __FILE__)
      include ActsAsUser::Generators::OrmHelpers

      def copy_acts_as_user_migration
        #if (behavior == :invoke && model_exists?) || (behavior == :revoke && migration_exists?(table_name))
         # migration_template "existing_migration.rb", "db/migrate/add_ninsho_to_#{table_name}"
        #else
        migration_template "migration.rb", "db/migrate/add_acts_as_user_#{table_name}"
        #end
      end

      def generate_model
        invoke "active_record:model", [name], :migration => false unless model_exists? && behavior == :invoke
      end
    end
  end
end
