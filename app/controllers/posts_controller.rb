class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC")
  end
  def create
    post = Post.create(content:params[:content], checked: false)
    render json:{post:post} 
  end #この上記の二つでメモ作成時に未読の情報を保存するようにしたこととAjaxを実現するためにレスポンスをjsonに変更したこと
  def checked
    post = Post.find(params[:id])
    if post.checked then
      post.update(checked: false)
    else
      post.update(checked: true)
    end
    item = Post.find(params[:id])
    render json: { post: item }
  end

end