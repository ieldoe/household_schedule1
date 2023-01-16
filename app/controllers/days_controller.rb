class DaysController < ApplicationController
  before_action :day_find, only: %i[update edit destroy]
  before_action :set_q, only: %i[search graph]

  def index
    @days = current_user.days.all
  end

  def show
    @day = current_user.days.all
    @days = @day.where(calender_day: params[:id])
    @calender_day = params[:id]

  end

  def new
    @tags = Tag.where(user_id: current_user).or(Tag.where(classification: 'add'))
    @day = Day.new
  end

  def edit
    @tags = Tag.where(user_id: current_user).or(Tag.where(classification: 'add'))
  end

  def create
    @day = Day.new(day_params.merge(user_id: current_user.id))
    @day.calender_day = I18n.l(@day.start_time)
    @day.s_time = I18n.l(@day.start_time, format: :short)
    if @day.save
      # saveが完了したら、一覧ページへリダイレクト
      redirect_to days_path
    else
      # saveを失敗すると新規作成ページへ
      render 'new'
    end
  end

  def update
    @day.s_time = I18n.l(@day.start_time)
    if @day.update(day_params.merge(s_time: I18n.l(@day.start_time)))
      # updateが完了したら一覧ページへリダイレクト
      redirect_to day_path
    else
      # updateを失敗すると編集ページへ
      render 'edit'
    end
  end

  def destroy
    day = @day.calender_day
    redirect_to url: day_path(day)
  end

  def search

  end

  def graph
    @results = @q.result(distinct: true)
    @sum_price = @results.sum(:price)
  end

  private

  def day_params
    params.require(:day).permit(:tag_id, :event, :price, :start_time, :e_time, :calender_day)
  end

  def day_find
    @day = Day.find(params[:id])
  end

  def set_q
    @q = current_user.days.ransack(params[:q])


  end

end
