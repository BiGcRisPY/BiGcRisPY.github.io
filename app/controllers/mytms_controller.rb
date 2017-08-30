class MytmsController < ApplicationController
  def index
    @mytms = Mytm.where({ :trainer_id => current_trainer.id }).sort_by{ |t| t.tm.id }

    @mytm = Mytm.new

    render("mytms/index.html.erb")
  end

  def show
    @mytm = Mytm.find(params[:id])

    @myPokes = Pokedex.where({ :trainer_id => current_trainer.id }).sort_by{ |p| p.pokemon.id }

    @learnedtms = Learnedtm.all

    render("mytms/show.html.erb")
  end

  def new
    @mytm = Mytm.new

    render("mytms/new.html.erb")
  end

  def create
    @mytm = Mytm.new

    @mytms = Mytm.where({ :trainer_id => current_trainer.id }).sort_by{ |t| t.tm.id }

    @mytm.tm_id = params[:tm_id]
    @mytm.trainer_id = params[:trainer_id]

    save_status = @mytm.save

    if save_status == true
      redirect_to("/mytms/#{@mytm.id}", :notice => "Mytm created successfully.")
    else
      render("mytms/index.html.erb")
    end
  end

  def edit
    @mytm = Mytm.find(params[:id])

    render("mytms/edit.html.erb")
  end

  def update
    @mytm = Mytm.find(params[:id])

    @mytm.tm_id = params[:tm_id]
    @mytm.trainer_id = params[:trainer_id]

    save_status = @mytm.save

    if save_status == true
      redirect_to("/mytms/#{@mytm.id}", :notice => "Mytm updated successfully.")
    else
      render("mytms/edit.html.erb")
    end
  end

  def destroy
    @mytm = Mytm.find(params[:id])

    @mytm.destroy

    if URI(request.referer).path == "/mytms/#{@mytm.id}"
      redirect_to("/mytms", :notice => "Mytm deleted.")
    else
      redirect_to(:back, :notice => "Mytm deleted.")
    end
  end
end
