class TypesController < ApplicationController
  def index
    @types = Type.all

    render("types/index.html.erb")
  end

  def show
    @type = Type.find(params[:id])

    @types = Type.all

    @pokedexes = Pokedex.where({ :trainer_id => current_trainer.id })

    @offense = @type.defense_battles.where( "effectiveness >=1")

    @defense = @type.offense_battles.where("effectiveness <1")

    @aoffense = @type.defense_battles.where("effectiveness <1")

    @adefense = @type.offense_battles.where("effectiveness >1")

    render("types/show.html.erb")
  end

  def new
    @type = Type.new

    render("types/new.html.erb")
  end

  def create
    @type = Type.new

    @type.title = params[:title]

    save_status = @type.save

    if save_status == true
      redirect_to("/types/#{@type.id}", :notice => "Type created successfully.")
    else
      render("types/new.html.erb")
    end
  end

  def edit
    @type = Type.find(params[:id])

    render("types/edit.html.erb")
  end

  def update
    @type = Type.find(params[:id])

    @type.title = params[:title]

    save_status = @type.save

    if save_status == true
      redirect_to("/types/#{@type.id}", :notice => "Type updated successfully.")
    else
      render("types/edit.html.erb")
    end
  end

  def destroy
    @type = Type.find(params[:id])

    @type.destroy

    if URI(request.referer).path == "/types/#{@type.id}"
      redirect_to("/", :notice => "Type deleted.")
    else
      redirect_to(:back, :notice => "Type deleted.")
    end
  end
end
