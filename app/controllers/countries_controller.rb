class CountriesController < ApplicationController
  before_filter :check_admin_user

  def index
    @countries = Country.page(params[:page])
  end

  def show
    @country = Country.find(params[:id])
  end

  def new
    @country = Country.new
  end

  def edit
    @country = Country.find(params[:id])
  end

  def create
    @country = Country.new(params[:country])
    if @country.save
      redirect_to(@country, :notice => 'Страна добавлена.')
    else
      render :action => "new"
    end
  end

  def update
    @country = Country.find(params[:id])

    if @country.update_attributes(params[:country])
      redirect_to(@country, :notice => 'Страна изменена.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @country = Country.find(params[:id])
    @country.destroy
    flash[:notice]="Страна удалена"
    redirect_to(countries_url)
  end

end
