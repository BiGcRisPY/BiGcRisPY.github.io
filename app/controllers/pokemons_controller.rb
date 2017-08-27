class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all

    render("pokemons/index.html.erb")
  end

  def show
    @pokemon = Pokemon.find(params[:id])

    if @pokemon.id < 10
      @zero = "00"
    elsif @pokemon.id < 100
      @zero = "0"
    else
      @zero = ""
    end

    @previd = params[:id].to_i - 1
    if @previd > 0
      @prevpoke = Pokemon.find(@previd)

      if @previd < 10
        @prevzero = "00"
      elsif @previd < 100
        @prevzero = "0"
      else
        @prevzero = ""
      end
    end

    @nextid = params[:id].to_i + 1
    if @nextid < 152
      @nextpoke = Pokemon.find(@nextid)

      if @nextid < 10
        @nextzero = "00"
      elsif @nextid < 100
        @nextzero = "0"
      else
        @nextzero = ""
      end
    end

    if @pokemon.evo_outcome.to_i > 0 && @pokemon.creature != "Eevee"
      @evopoke = Pokemon.find(@pokemon.evo_outcome.to_i)
    elsif @pokemon.creature == "Eevee"
      @evopoke = [Pokemon.find(134), Pokemon.find(135), Pokemon.find(136)]
    else
      @evopoke = ""
    end

    render("pokemons/show.html.erb")
  end

  def new
    @pokemon = Pokemon.new

    render("pokemons/new.html.erb")
  end

  def create
    @pokemon = Pokemon.new

    @pokemon.creature = params[:creature]
    @pokemon.evo_level = params[:evo_level]
    @pokemon.evo_outcome = params[:evo_outcome]
    @pokemon.image = params[:image]

    save_status = @pokemon.save

    if save_status == true
      redirect_to("/pokemons/#{@pokemon.id}", :notice => "Pokemon created successfully.")
    else
      render("pokemons/new.html.erb")
    end
  end

  def edit
    @pokemon = Pokemon.find(params[:id])

    render("pokemons/edit.html.erb")
  end

  def update
    @pokemon = Pokemon.find(params[:id])

    @pokemon.creature = params[:creature]
    @pokemon.evo_level = params[:evo_level]
    @pokemon.evo_outcome = params[:evo_outcome]
    @pokemon.image = params[:image]

    save_status = @pokemon.save

    if save_status == true
      redirect_to("/pokemons/#{@pokemon.id}", :notice => "Pokemon updated successfully.")
    else
      render("pokemons/edit.html.erb")
    end
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])

    @pokemon.destroy

    if URI(request.referer).path == "/pokemons/#{@pokemon.id}"
      redirect_to("/", :notice => "Pokemon deleted.")
    else
      redirect_to(:back, :notice => "Pokemon deleted.")
    end
  end
end
