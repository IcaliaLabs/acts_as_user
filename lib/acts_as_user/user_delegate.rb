module ActsAsUser
  module UserDelegate
    def self.included(base)
      base.has_one :user, :as => :userable, :dependent => :destroy, :autosave => true, inverse_of: :userable
      base.validate :user_must_be_valid
      base.alias_method_chain :user, :autobuild
      base.extend ClassMethods
      base.define_user_accessors
    end

    def user_with_autobuild
      user_without_autobuild || build_user
    end

    def method_missing(meth, *args, &blk)
      user.send(meth, *args, &blk)
    rescue NoMethodError
      super
    end

    def deep_inspect
      "#{self.inspect} -- #{self.user.inspect}"
    end

    protected

    def user_must_be_valid
      unless user.valid?
        user.errors.each do |attr, message|
          errors.add(attr, message)
        end
      end
    end

    module ClassMethods

      def define_user_accessors
        #We check the user columns to declare them as attributes to delegate
        all_attributes = User.columns.map(&:name)

        attributes_to_delegate = all_attributes - ActsAsUser.ignored_attributes

        #User method delegation
        attributes_to_delegate.each do |attrib|
          class_eval <<-RUBY
          def #{attrib}
            user.#{attrib}
          end

          def #{attrib}=(value)
            self.user.#{attrib} = value
          end

          def #{attrib}?
            self.user.#{attrib}?
          end
            RUBY
        end
      end
    end
  end
end
