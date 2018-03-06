class UsersController < ApplicationController
    before_action :authenticate_user!    

    def show
        @user = current_user
        @name = @user.email
     end

    def edits
        @user = User.new
    end

    def update
        @user = current_user
        if @user.update(user_params)
          redirect_to action: 'show'
       else
         render :edit
       end        
    end

    def user_params
        params.require(:user).permit(:loginid, :name, :self, :pic)
    end
end
