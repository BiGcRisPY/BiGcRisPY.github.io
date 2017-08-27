class LearnedtmsController < ApplicationController
  def index
    @learnedtms = Learnedtm.all

    render("learnedtms/index.html.erb")
  end

  def show
    @learnedtm = Learnedtm.find(params[:id])

    render("learnedtms/show.html.erb")
  end

  def new
    @learnedtm = Learnedtm.new

    render("learnedtms/new.html.erb")
  end

  def create
    @learnedtm = Learnedtm.new

    @learnedtm.pokemon_id = params[:pokemon_id]
    @learnedtm.tm_id = params[:tm_id]

    save_status = @learnedtm.save

    if save_status == true
      redirect_to("/learnedtms/#{@learnedtm.id}", :notice => "Learnedtm created successfully.")
    else
      render("learnedtms/new.html.erb")
    end
  end

  def edit
    @learnedtm = Learnedtm.find(params[:id])

    render("learnedtms/edit.html.erb")
  end

  def update
    @learnedtm = Learnedtm.find(params[:id])

    @learnedtm.pokemon_id = params[:pokemon_id]
    @learnedtm.tm_id = params[:tm_id]

    save_status = @learnedtm.save

    if save_status == true
      redirect_to("/learnedtms/#{@learnedtm.id}", :notice => "Learnedtm updated successfully.")
    else
      render("learnedtms/edit.html.erb")
    end
  end

  def destroy
    @learnedtm = Learnedtm.find(params[:id])

    @learnedtm.destroy

    if URI(request.referer).path == "/learnedtms/#{@learnedtm.id}"
      redirect_to("/", :notice => "Learnedtm deleted.")
    else
      redirect_to(:back, :notice => "Learnedtm deleted.")
    end
  end
end
