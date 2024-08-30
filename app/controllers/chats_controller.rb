class ChatsController < ApplicationController
  before_action :set_chat, only: %i[ show ]
  before_action :set_friends, only: %i[ index show ]

  def index
  end

  def show
    render action: :index
  end

  def create
    another_user = User.find(params[:user_id])
    chat = Chat.find_or_create_for(current_user, another_user)

    redirect_to chat
  end

  private
    def set_chat
      @chat = Chat.includes(:members).find(params[:id])
    end

    def set_friends
      @friends = User.where.not(id: current_user.id).all
    end

    def chat_params
      params.require(:chat).permit(:name)
    end
end
