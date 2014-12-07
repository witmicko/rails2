class StaticPagesController < ApplicationController
  def home
    if current_user
      @followed = current_user.following.entries
      @followed << current_user
      @feed = Activity.desc(:created_at).where(:user.in => @followed).limit(20)
    end
  end

  def help
  end

  def about

  end

  def contact

  end
end
