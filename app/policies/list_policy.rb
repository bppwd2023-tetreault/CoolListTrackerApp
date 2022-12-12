class ListPolicy < ApplicationPolicy

  def index?
    true # they should ALWAYS be allowed to see everything
  end

  def show?
    if(@user.id == @record.user_id) 
      return true
    else 
      return false
    end
  end
  
  def create?
    true
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

end