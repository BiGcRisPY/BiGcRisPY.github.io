class PoketypesController < ApplicationController
  def index
    @poketypes = Poketype.all

    render("poketypes/index.html.erb")
  end

  def show
    @poketype = Poketype.find(params[:id])

    render("poketypes/show.html.erb")
  end

  def new
    @poketype = Poketype.new

    render("poketypes/new.html.erb")
  end

  def create
    @poketype = Poketype.new

    @poketype.pokemon_id = params[:pokemon_id]
    @poketype.type_id = params[:type_id]

    save_status = @poketype.save

    if save_status == true
      redirect_to("/poketypes/#{@poketype.id}", :notice => "Poketype created successfully.")
    else
      render("poketypes/new.html.erb")
    end
  end

  def edit
    @poketype = Poketype.find(params[:id])

    render("poketypes/edit.html.erb")
  end

  def update
    @poketype = Poketype.find(params[:id])

    @poketype.pokemon_id = params[:pokemon_id]
    @poketype.type_id = params[:type_id]

    save_status = @poketype.save

    if save_status == true
      redirect_to("/poketypes/#{@poketype.id}", :notice => "Poketype updated successfully.")
    else
      render("poketypes/edit.html.erb")
    end
  end

  def destroy
    @poketype = Poketype.find(params[:id])

    @poketype.destroy

    if URI(request.referer).path == "/poketypes/#{@poketype.id}"
      redirect_to("/", :notice => "Poketype deleted.")
    else
      redirect_to(:back, :notice => "Poketype deleted.")
    end
  end
end
