class TagsController < ApplicationController
  before_action :tag_find, only: %i[update edit destroy]
  def index
    @tags = current_user.tags.all
  end

  def new
    @tag = Tag.new
  end

  def edit; end

  def create
    @tag = Tag.new(tag_params.merge(user_id: current_user.id))
    @tag.classification = 1
    if @tag.save
      # saveが完了したら、一覧ページへリダイレクト
      redirect_to tags_path
    else
      # saveを失敗すると新規作成ページへ
      render 'new'
    end
  end

  def update
    if @tag.update(tag_params)
      # updateが完了したら一覧ページへリダイレクト
      redirect_to tags_path
    else
      # updateを失敗すると編集ページへ
      render 'edit'
    end
  end

  def destroy
    @tag.delete
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def tag_find
    @tag = current_user.tags.find(params[:id])
  end
end
