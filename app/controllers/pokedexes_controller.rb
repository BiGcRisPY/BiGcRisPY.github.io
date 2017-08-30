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

    @pokemon = Pokemon.all.order(:creature)

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
      redirect_to("/pokedexes", :notice => "Pokedex deleted.")
    else
      redirect_to(:back, :notice => "Pokedex deleted.")
    end
  end

  def levels
    @pokedexes = Pokedex.all

    @leveling = Hash.new
    @outcomes = Hash.new

    @pokedexes.each do |p|

      @new_move_level = p.learnedmoves.find_by("level_learned > ?", p.current_level).level_learned

      if p.pokemon.evo_level.to_i > 0

        # Need to test...What if no moves left?
        @levels_left = [[@new_move_level, p.pokemon.evo_level.to_i].compact.min - p.current_level, 1].max

        if @new_move_level <= p.pokemon.evo_level.to_i

          @outcome = p.learnedmoves.find_by("level_learned > ?", p.current_level).move.name

        else

          @outcome = Pokemon.find(p.pokemon.evo_outcome.to_i).creature

        end

      else

        @levels_left = @new_move_level - p.current_level

        @outcome = p.learnedmoves.find_by("level_learned > ?", p.current_level).move.name

      end

      @leveling[p.id] = @levels_left
      @outcomes[p.id] = @outcome


    end

    render("pokedexes/levels.html.erb")
  end
end
