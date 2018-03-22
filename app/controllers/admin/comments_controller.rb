class Admin::CommentsController < ApplicationController
  before_action :load_commentable

  def create
    comment = Comment.new(comment_params)
    comment.commentable = @commentable
    comment.user = current_user
    comment.save
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :commentable_type)
  end

  def load_commentable
    type = comment_params[:commentable_type]
    id = params["#{type.downcase}_id".to_sym]
    @commentable = type.classify.constantize.find(id)
  end
end
