class UsersController < ApplicationController

  def index

    matching_users = User.all
    @list_of_users = matching_users.order(:username => :asc)

    # @list_of_users = ....

    render(template: "users_templates/index")
  end

  def show
    matching_username = params.fetch("path_username")

    username_record = User.where(:username => matching_username)

    @user = username_record.at(0)

    if @user == nil
      redirect_to("/404")
    else
      render(template: "users_templates/show")
    end
  end

  def create
    @user = User.new
    @user.username = params.fetch("new_user_field")
    if @user.valid?
      @user.save
      redirect_to("/users/#{@user.username}")
    else
      redirect_to("/users")
    end
  end

end
