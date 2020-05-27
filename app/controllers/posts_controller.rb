class PostsController < ApplicationController
  def index
    posts = Post.where(active: true)

    posts = posts.map do |post|
      {
        title: post.title,
        body: post.body,
        created_at: post.created_at.strftime('%m/%d/%Y')
      }
    end

    render json: { posts: posts }.to_json, status: :ok
  end

  def create
    post = Post.new(post_params(params))
    post.save!

    render json: { post: post }.to_json, status: :ok
  end

  def show
    post =  Post.find(params[:id])

    render json: { post: post }.to_json, status: :ok
  end

  private

  def post_params(params)
    params.permit(:title, :body, :active)
  end
end