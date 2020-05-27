class PostsController < ApplicationController
  def index
    posts = Post.where(active: true)

    render json: { posts: posts }.to_json, status: :ok
  end

  def show
    post =  Post.find(params[:id])

    render json: { post: post }.to_json, status: :ok
  end
end