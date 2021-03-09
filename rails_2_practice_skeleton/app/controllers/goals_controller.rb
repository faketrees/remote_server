class GoalsController < ApplicationController
    before_action :require_logged_in!

    def create
        @goal = Goal.new(goal_params)
        @goal.user_id = params[:user_id]

        if @goal.save
        else
            flash[:errors] = @goal.errors.full_messages
        end

        redirect_to user_url(@goal.user)
    end

    def destroy
        @goal = current_user.goals.find_by(id: params[:id])
        if @goal && @goal.delete
            redirect_to users_url
        end
    end

        def edit
        @goal = current_user.goals.find_by(id: params[:id])
        render :edit
    end

    def update
        @goal = current_user.goalss.find_by(id: params[:id])

        if @goal
            if @goal.update(goal_params)
                redirect_to user_url(current_user)
            else
                flash[:errors] = ['Invalid Parameters']
                render :edit
            end
        else
            flash[:errors] = ['User not found']
            redirect_to user_url(current_user)
        end
    end

    private
    def goal_params
        params.require(:goal).permit(:name, :details, :status)
    end
end
