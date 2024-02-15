class CommentsController < ApplicationController

  def create
    @comment = Comment.new
    @comment.photo_id = params.fetch("insert_photo_id")
    @comment.author_id = params.fetch("insert_author_id")
    @comment.body = params.fetch("insert_comment_body")
    if @comment.commenter.valid?
      @comment.save
      redirect_to("/photos/#{@comment.photo_id}", allow_other_host: true)
    else
      redirect_to("/photos/#{@comment.photo_id}", allow_other_host: true)
    end
  end
end
