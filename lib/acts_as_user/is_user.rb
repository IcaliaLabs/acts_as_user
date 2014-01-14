module ActsAsUser
  module IsUser

    def self.included(base)
      base.belongs_to :userable, polymorphic: true
      base.extend ClassMethods
      #loads models acting as users when the hook is loaded
      ActiveSupport.on_load :user_delegate do
        base.define_models_acting_like_users
      end
    end

    module ClassMethods
      def define_models_acting_like_users
        ActsAsUser.models_acting_like_users.each do |model_class_name|
          define_method("#{model_class_name.downcase}?") do
            self.userable_type == model_class_name
          end
        end
      end
    end
  end
end
