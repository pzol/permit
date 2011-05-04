require 'test_config'
require 'ability'


class Ability
  include Permit::Ability

  def initialize
    role :admin do
      can :cancel, :booking
      can :read, :calculations, :tourop => 1, :agent => 0
      can :read, :booking, :contracts => [/aer/], :agent => 0
    end

    role :user do
      can :read, :booking
    end
  end
end

context Permit::Ability do
  setup do
    Ability.new
  end

  asserts(:rules).size(4)
  asserts(:can?, :admin, :cancel, :booking)
  asserts(":can? with arguments(s) [:admin, :read, :calculations] #conditions") {topic.can?(:admin, :read, :calculations).conditions}.equals(:tourop => 1, :agent => 0)
  asserts(:can?, :admin, :read, :calculations)
  asserts(:can?, :user, :read, :booking)
  asserts(:cannot?, :user, :cancel, :booking)
  denies(:can?, :user, :cancel, :booking)
end

__END__
Basic recommended actions: :create, :read, :update, :delete

if can? :cancel, :booking
if can? :read, :calculations

resources = { :booking => {
    :admin => [:cancel],
    :all => [:read]
  }
}
