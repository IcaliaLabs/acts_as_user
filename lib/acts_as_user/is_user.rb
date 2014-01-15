module ActsAsUser
  module IsUser

    def self.included(base)
      base.belongs_to :userable, polymorphic: true
      base.extend ClassMethods
      #loads models acting as users when the hook is loaded
      base.define_models_acting_as_users
    end

    module ClassMethods
      def define_models_acting_as_users
        ActsAsUser.models_acting_as_users.each do |model_class_name|
          define_method("#{model_class_name.to_s.downcase}?") do
            self.userable_type.downcase == model_class_name.to_s.downcase
          end
        end
      end
    end
  end
end
