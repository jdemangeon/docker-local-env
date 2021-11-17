
class UsersController < ApplicationController
    before_action :set_name, only: [:show, :update, :destroy]
    has_scope :first_name, type: :default

    def index
      @scoped_users = apply_scopes(User)
      
      start_cursor, end_cursor = [0, 10]
      if params['range'].present?
        start_cursor, end_cursor = params[:range][1..-2].split(',').map(&:to_i)
      end
      
      @users = @scoped_users.limit(end_cursor - start_cursor).offset(start_cursor)
  
      response.set_header('Access-Control-Expose-Headers', 'Content-Range')
      response.set_header('Content-Range',"adrs #{start_cursor}-#{end_cursor}/#{@scoped_users.count}");
  
      render json: @users 
    end
    
    def show
      render json: @user
    end
  
    def create
      @user = User.new(user_params)
  
      if @user.save
        render json: @user, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @user.destroy
      render json: { id: @user.id }
    end
  
    private
      def set_name
        @user = User.find(params[:id])
      end
  
      def user_params
        params.permit(:first_name, :last_name)
      end 
  end  
  