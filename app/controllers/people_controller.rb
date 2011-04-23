class PeopleController < ApplicationController
  before_filter :check_admin_user, :except => ['show', 'index']

  def index
    respond_to do |format|
      format.html{@people = Person.page(params[:page])}
      format.json do
         @people=Person.where("lower(name) LIKE lower(?)","%#{params[:q]}%").all
        render :json=>@people.map(&:attributes)
      end
    end

  end

  def show
    @person = Person.includes(:director_films,:films).find(params[:id])
  end

  def new
    @person = Person.new
  end

  def edit
    @person = Person.find(params[:id])
  end

  def create
    @person = Person.new(params[:person])
    if @person.save
      redirect_to(@person, :notice => 'Персона создана.')
    else
      render :action => "new"
    end
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(params[:person])
      redirect_to(@person, :notice => 'Персона сохранена.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to people_url, :notice=>"Персона удалена"
  end
end
