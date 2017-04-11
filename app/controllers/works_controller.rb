class WorksController < ApplicationController

  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create

    @work = Work.create(work_params)
    if @work.save
      redirect_to works_path
    else
      render :new
    end

  end

  def show
    @work = Work.find_by_id(params[:id])
    if !@work
      render_404
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    if @work.update(work_params)
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    @work = Work.find(params[:id])
    @work.votes.each do |vote|
      vote.destroy
    end
    @work.destroy
    redirect_to :root
  end

  def movies
    @movies = Work.where(category: "movie").order('votes_count DESC')
    # @movies = Work.joins(:votes).group("work.votes, ").order("max(votes.count) DESC")

  end

  def books
    @books = Work.where(category: "book").order('votes_count DESC')
  end

  def albums
    @albums = Work.where(category: "album").order('votes_count DESC')
  end

  private

  def work_params
    params.require(:work).permit(:title, :creator, :published, :description, :category)
  end

end
