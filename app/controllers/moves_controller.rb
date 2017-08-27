class MovesController < ApplicationController
  def index
    @moves = Move.all

    render("moves/index.html.erb")
  end

  def show
    @move = Move.find(params[:id])

    render("moves/show.html.erb")
  end

  def new
    @move = Move.new

    render("moves/new.html.erb")
  end

  def create
    @move = Move.new

    @move.name = params[:name]
    @move.effect = params[:effect]

    save_status = @move.save

    if save_status == true
      redirect_to("/moves/#{@move.id}", :notice => "Move created successfully.")
    else
      render("moves/new.html.erb")
    end
  end

  def edit
    @move = Move.find(params[:id])

    render("moves/edit.html.erb")
  end

  def update
    @move = Move.find(params[:id])

    @move.name = params[:name]
    @move.effect = params[:effect]

    save_status = @move.save

    if save_status == true
      redirect_to("/moves/#{@move.id}", :notice => "Move updated successfully.")
    else
      render("moves/edit.html.erb")
    end
  end

  def destroy
    @move = Move.find(params[:id])

    @move.destroy

    if URI(request.referer).path == "/moves/#{@move.id}"
      redirect_to("/", :notice => "Move deleted.")
    else
      redirect_to(:back, :notice => "Move deleted.")
    end
  end
end
