class FilmsController < ApplicationController
  before_filter :check_admin_user, :except=>['index', 'show']

  def index
    @films = Film.page(params[:page])
  end

  def show
    @film = Film.full_load.find(params[:id])
    @current_genre=@film.genre #for layout
  end

  def new
    @film = Film.new
  end

  def edit
    @film = Film.full_load.find(params[:id])
  end

  def create
    @film = Film.new(params[:film])
    if @film.save
      redirect_to @film, :notice => 'Фильм добавлен.'
    else
      render :action => "new"
    end
  end

  def update
    @film = Film.full_load.find(params[:id])
    if @film.update_attributes(params[:film])
      redirect_to @film, :notice => 'Фильм сохранен.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @film = Film.find(params[:id])
    @film.destroy
    redirect_to films_url, :notice=>"Фильм удален"
  end
end
