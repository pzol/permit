module Permit
  module Ability

    def role(role, &block)
      @current_role = role
      block.call
    end

    def can?(role, action, subject)
      rules.detect {|r| r.matches? role, action, subject}
    end

    def cannot?(role, action, subject)
      !can?(role, action, subject)
    end

    def can(action, subject, conditions = {})
      rules << Rule.new(@current_role, action, subject, conditions)
    end

    def rules
      @rules ||= []
    end

  end
end
