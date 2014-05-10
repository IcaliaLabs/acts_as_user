module ActsAsUser
  class Railtie < Rails::Railtie
      #Adds namespace for eager loading
      config.eager_load_namespaces << ActsAsUser

      ActiveSupport.on_load :active_record do
        ActsAsUser.add_devise_attributes_to_ignore

        class ActiveRecord::Base
          cattr_accessor :acts_as_user_options
          def self.acts_as_user options={}
            self.acts_as_user_options = options
            include ActsAsUser::UserDelegate
          end
          def self.is_user
            include ActsAsUser::IsUser
          end
        end
      end
  end
end
