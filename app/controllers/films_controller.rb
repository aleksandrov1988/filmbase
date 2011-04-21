class FilmsController < ApplicationController
  # GET /films
  # GET /films.xml
  def index
    @films = Film.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @films }
    end
  end

  # GET /films/1
  # GET /films/1.xml
  def show
    @film = Film.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @film }
    end
  end

  # GET /films/new
  # GET /films/new.xml
  def new
    @film = Film.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @film }
    end
  end

  # GET /films/1/edit
  def edit
    @film = Film.find(params[:id])
  end

  # POST /films
  # POST /films.xml
  def create
    @film = Film.new(params[:film])

    respond_to do |format|
      if @film.save
        format.html { redirect_to(@film, :notice => 'Film was successfully created.') }
        format.xml  { render :xml => @film, :status => :created, :location => @film }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @film.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /films/1
  # PUT /films/1.xml
  def update
    @film = Film.find(params[:id])

    respond_to do |format|
      if @film.update_attributes(params[:film])
        format.html { redirect_to(@film, :notice => 'Film was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @film.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /films/1
  # DELETE /films/1.xml
  def destroy
    @film = Film.find(params[:id])
    @film.destroy

    respond_to do |format|
      format.html { redirect_to(films_url) }
      format.xml  { head :ok }
    end
  end
end
