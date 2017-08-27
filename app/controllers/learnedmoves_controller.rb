class LearnedmovesController < ApplicationController
  def index
    @learnedmoves = Learnedmove.all

    render("learnedmoves/index.html.erb")
  end

  def show
    @learnedmove = Learnedmove.find(params[:id])

    render("learnedmoves/show.html.erb")
  end

  def new
    @learnedmove = Learnedmove.new

    render("learnedmoves/new.html.erb")
  end

  def create
    @learnedmove = Learnedmove.new

    @learnedmove.pokemon_id = params[:pokemon_id]
    @learnedmove.level_learned = params[:level_learned]
    @learnedmove.move_id = params[:move_id]

    save_status = @learnedmove.save

    if save_status == true
      redirect_to("/learnedmoves/#{@learnedmove.id}", :notice => "Learnedmove created successfully.")
    else
      render("learnedmoves/new.html.erb")
    end
  end

  def edit
    @learnedmove = Learnedmove.find(params[:id])

    render("learnedmoves/edit.html.erb")
  end

  def update
    @learnedmove = Learnedmove.find(params[:id])

    @learnedmove.pokemon_id = params[:pokemon_id]
    @learnedmove.level_learned = params[:level_learned]
    @learnedmove.move_id = params[:move_id]

    save_status = @learnedmove.save

    if save_status == true
      redirect_to("/learnedmoves/#{@learnedmove.id}", :notice => "Learnedmove updated successfully.")
    else
      render("learnedmoves/edit.html.erb")
    end
  end

  def destroy
    @learnedmove = Learnedmove.find(params[:id])

    @learnedmove.destroy

    if URI(request.referer).path == "/learnedmoves/#{@learnedmove.id}"
      redirect_to("/", :notice => "Learnedmove deleted.")
    else
      redirect_to(:back, :notice => "Learnedmove deleted.")
    end
  end
end
