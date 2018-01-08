class GroupsController < ApplicationController
    def index
        # @ideas =Idea.all
        @groups = Group.all
        @user = User.find(session[:user_id])
    end


    def create
        @user = User.find(session[:user_id])
        puts "inside create group "
        group = Group.new(group_params)
        if group.valid?
            group.save
          Member.create(user_id: session[:user_id], group_id: group.id)
        # group = Group.create(group_params)
        # member = Member.create(group: group,user_id: session[:user_id])
        # puts "inside group controller create"

       
        # if  group.valid?
        #     # Group.create(user_id: session[:user_id], group_id: group.id)
        #     group.save
        #     member.save
        #     # Member.create(user_id: session[:user_id], group_id: group.id)
            redirect_to "/groups"
        else
            flash[:errors] = group.errors.full_messages
            redirect_to "/groups"
        end

    end

    def show
        # @idea = Idea.find(params[:id])
        @group = Group.find(params[:id])
        @members = Member.where(group_id: params[:id])
    end

    def update
    end


    def destroy
        # Idea.find(params[:id]).destroy
        puts "inside delete of group controller"
        # Member.where(group_id: params[:id]).destroy
        member = Member.where(group_id: params[:id])
        Member.delete(member)
        Group.find(params[:id]).destroy

        redirect_to '/groups'
    end


    private

        def group_params
            params.require(:group).permit(:name, :description, :user_id)
        end
end
