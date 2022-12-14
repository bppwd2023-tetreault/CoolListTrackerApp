class ListPolicy < ApplicationPolicy

  # add group based access


  def index?
    true # they should ALWAYS be allowed to see everything
  end

  def show?
    if(@user.id == @record.user_id) # if the current user is the one who created the list
      return true
    elsif(@record.group.users.include?(@user) if @record.group) # allow the user to see the list if they are part of the group that the list is a part of. Or if they created the list.
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
    # Only allow delete if the current user is the user that created the list
  end

end