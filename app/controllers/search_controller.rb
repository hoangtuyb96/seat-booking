class SearchController < ApplicationController
  def users
    @q = User.ransack(params[:q])

    @users = @q.result(distinct: true)
  end
end
