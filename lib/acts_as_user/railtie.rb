module ActsAsUser
  class Railtie < Rails::Railtie
    ActiveSupport.on_load :active_record do
      ActsAsUser.add_devise_attributes_to_ignore
      class ActiveRecord::Base
        def self.acts_as_user
          include ActsAsUser::UserDelegate    
        end
        def self.is_user
          include ActsAsUser::IsUser
        end
      end
    end
  end
end
