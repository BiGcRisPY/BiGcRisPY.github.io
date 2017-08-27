class PokedexesController < ApplicationController
  def index

    @pokedexes = Pokedex.where({ :trainer_id => current_trainer.id }).sort_by{ |p| p.pokemon.id }

    render("pokedexes/index.html.erb")
  end

  def show
    @pokedex = Pokedex.find(params[:id])

    if @pokedex.pokemon.id <10
      @zero = "00"
    elsif @pokedex.pokemon.id < 100
      @zero = "0"
    else
      @zero = ""
    end

    @tmsHave = Mytm.where({ :trainer_id => current_trainer.id }).sort_by{ |t| t.tm.id }

    if @pokedex.pokemon.evo_outcome.to_i > 0 && @pokedex.pokemon.creature != "Eevee"
      @evopoke = Pokemon.find(@pokedex.pokemon.evo_outcome.to_i)
    elsif @pokedex.pokemon.creature == "Eevee"
      @evopoke = [Pokemon.find(134), Pokemon.find(135), Pokemon.find(136)]
    else
      @evopoke = ""
    end

    @pokemons = Pokemon.all

    render("pokedexes/show.html.erb")
  end

  def new
    @pokedex = Pokedex.new

    @pokemon = Pokemon.all.order(:creature)

    render("pokedexes/new.html.erb")
  end

  def create
    @pokedex = Pokedex.new

    @pokedex.pokemon_id = params[:pokemon_id]
    @pokedex.nickname = params[:nickname]
    @pokedex.current_level = params[:current_level]
    @pokedex.trainer_id = params[:trainer_id]

    save_status = @pokedex.save

    if save_status == true
      redirect_to("/pokedexes/#{@pokedex.id}", :notice => "Pokedex created successfully.")
    else
      render("pokedexes/new.html.erb")
    end
  end

  def edit
    @pokedex = Pokedex.find(params[:id])

    render("pokedexes/edit.html.erb")
  end

  def update
    @pokedex = Pokedex.find(params[:id])

    @pokedex.pokemon_id = params[:pokemon_id]
    @pokedex.nickname = params[:nickname]
    @pokedex.current_level = params[:current_level]
    @pokedex.trainer_id = params[:trainer_id]

    save_status = @pokedex.save

    if save_status == true
      redirect_to("/pokedexes/#{@pokedex.id}", :notice => "Pokedex updated successfully.")
    else
      render("pokedexes/edit.html.erb")
    end
  end

  def destroy
    @pokedex = Pokedex.find(params[:id])

    @pokedex.destroy

    if URI(request.referer).path == "/pokedexes/#{@pokedex.id}"
      redirect_to("/", :notice => "Pokedex deleted.")
    else
      redirect_to(:back, :notice => "Pokedex deleted.")
    end
  end
end
