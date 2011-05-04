module Permit
  class Rule

    attr_reader :role, :action, :subject, :conditions
    def initialize(role, action, subject, conditions = {})
      @role = role
      @action = action
      @subject = subject
      @conditions = conditions
    end

    def matches?(role, action, subject)
      self.role == role && self.action == action && self.subject == subject
    end


    # attr_reader :base_behavior, :subjects, :actions, :conditions

    # The first argument when initializing is the base_behavior which is a true/false
    # value. True for "can" and false for "cannot". The next two arguments are the action
    # and subject respectively (such as :read, @project). The third argument is a hash
    # of conditions and the last one is the block passed to the "can" call.
    # def initialize(base_behavior, action, subject, conditions, block)
      # raise Error, "You are not able to supply a block with a hash of conditions in #{action} #{subject} ability. Use either one." if conditions.kind_of?(Hash) && !block.nil?
      # @match_all = action.nil? && subject.nil?
      # @base_behavior = base_behavior
      # @actions = [action].flatten
      # @subjects = [subject].flatten
      # @conditions = conditions || {}
      # @block = block
    # end

    # def relevant?(action, subject)
      # subject = subject.values.first if subject.class == Hash
      # @match_all || (matches_action?(action) && matches_subject?(subject))
    # end

  end
end
