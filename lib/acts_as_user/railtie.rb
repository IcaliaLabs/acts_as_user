module ActsAsUser
  class Railtie < Rails::Railtie
    ActiveSupport.on_load :active_record do
      class ActiveRecord::Base
        def self.acts_as_user
          include ActsAsUser::UserDelegate    
        end
      end
    end
  end
end
