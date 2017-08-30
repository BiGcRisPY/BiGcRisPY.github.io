Rails.application.routes.draw do

  # Routes for the Mytm resource:
  # CREATE
  get "/mytms/new", :controller => "mytms", :action => "new"
  post "/create_mytm", :controller => "mytms", :action => "create"

  # READ
  get "/mytms", :controller => "mytms", :action => "index"
  get "/mytms/:id", :controller => "mytms", :action => "show"

  # UPDATE
  get "/mytms/:id/edit", :controller => "mytms", :action => "edit"
  post "/update_mytm/:id", :controller => "mytms", :action => "update"

  # DELETE
  get "/delete_mytm/:id", :controller => "mytms", :action => "destroy"
  #------------------------------

  # Routes for the Pokedex resource:
  # CREATE
  get "/pokedexes/new", :controller => "pokedexes", :action => "new"
  post "/create_pokedex", :controller => "pokedexes", :action => "create"

  #LEVEL
  get "/pokedexes/levels", :controller => "pokedexes", :action => "levels"

  # READ
  get "/pokedexes", :controller => "pokedexes", :action => "index"
  get "/pokedexes/:id", :controller => "pokedexes", :action => "show"

  # UPDATE
  get "/pokedexes/:id/edit", :controller => "pokedexes", :action => "edit"
  post "/update_pokedex/:id", :controller => "pokedexes", :action => "update"

  # DELETE
  get "/delete_pokedex/:id", :controller => "pokedexes", :action => "destroy"
  #------------------------------

  devise_for :trainers

  root 'pokedexes#index'

  # Routes for the Battle resource:
  # CREATE
  get "/battles/new", :controller => "battles", :action => "new"
  post "/create_battle", :controller => "battles", :action => "create"

  # READ
  get "/battles", :controller => "battles", :action => "index"
  get "/battles/:id", :controller => "battles", :action => "show"

  # UPDATE
  get "/battles/:id/edit", :controller => "battles", :action => "edit"
  post "/update_battle/:id", :controller => "battles", :action => "update"

  # DELETE
  get "/delete_battle/:id", :controller => "battles", :action => "destroy"
  #------------------------------

  # Routes for the Poketype resource:
  # CREATE
  get "/poketypes/new", :controller => "poketypes", :action => "new"
  post "/create_poketype", :controller => "poketypes", :action => "create"

  # READ
  get "/poketypes", :controller => "poketypes", :action => "index"
  get "/poketypes/:id", :controller => "poketypes", :action => "show"

  # UPDATE
  get "/poketypes/:id/edit", :controller => "poketypes", :action => "edit"
  post "/update_poketype/:id", :controller => "poketypes", :action => "update"

  # DELETE
  get "/delete_poketype/:id", :controller => "poketypes", :action => "destroy"
  #------------------------------

  # Routes for the Learnedtm resource:
  # CREATE
  get "/learnedtms/new", :controller => "learnedtms", :action => "new"
  post "/create_learnedtm", :controller => "learnedtms", :action => "create"

  # READ
  get "/learnedtms", :controller => "learnedtms", :action => "index"
  get "/learnedtms/:id", :controller => "learnedtms", :action => "show"

  # UPDATE
  get "/learnedtms/:id/edit", :controller => "learnedtms", :action => "edit"
  post "/update_learnedtm/:id", :controller => "learnedtms", :action => "update"

  # DELETE
  get "/delete_learnedtm/:id", :controller => "learnedtms", :action => "destroy"
  #------------------------------

  # Routes for the Learnedmove resource:
  # CREATE
  get "/learnedmoves/new", :controller => "learnedmoves", :action => "new"
  post "/create_learnedmove", :controller => "learnedmoves", :action => "create"

  # READ
  get "/learnedmoves", :controller => "learnedmoves", :action => "index"
  get "/learnedmoves/:id", :controller => "learnedmoves", :action => "show"

  # UPDATE
  get "/learnedmoves/:id/edit", :controller => "learnedmoves", :action => "edit"
  post "/update_learnedmove/:id", :controller => "learnedmoves", :action => "update"

  # DELETE
  get "/delete_learnedmove/:id", :controller => "learnedmoves", :action => "destroy"
  #------------------------------

  # Routes for the Tm resource:
  # CREATE
  get "/tms/new", :controller => "tms", :action => "new"
  post "/create_tm", :controller => "tms", :action => "create"

  # READ
  get "/tms", :controller => "tms", :action => "index"
  get "/tms/:id", :controller => "tms", :action => "show"

  # UPDATE
  get "/tms/:id/edit", :controller => "tms", :action => "edit"
  post "/update_tm/:id", :controller => "tms", :action => "update"

  # DELETE
  get "/delete_tm/:id", :controller => "tms", :action => "destroy"
  #------------------------------

  # Routes for the Move resource:
  # CREATE
  get "/moves/new", :controller => "moves", :action => "new"
  post "/create_move", :controller => "moves", :action => "create"

  # READ
  get "/moves", :controller => "moves", :action => "index"
  get "/moves/:id", :controller => "moves", :action => "show"

  # UPDATE
  get "/moves/:id/edit", :controller => "moves", :action => "edit"
  post "/update_move/:id", :controller => "moves", :action => "update"

  # DELETE
  get "/delete_move/:id", :controller => "moves", :action => "destroy"
  #------------------------------

  # Routes for the Type resource:
  # CREATE
  get "/types/new", :controller => "types", :action => "new"
  post "/create_type", :controller => "types", :action => "create"

  # READ
  get "/types", :controller => "types", :action => "index"
  get "/types/:id", :controller => "types", :action => "show"

  # UPDATE
  get "/types/:id/edit", :controller => "types", :action => "edit"
  post "/update_type/:id", :controller => "types", :action => "update"

  # DELETE
  get "/delete_type/:id", :controller => "types", :action => "destroy"
  #------------------------------

  # Routes for the Pokemon resource:
  # CREATE
  get "/pokemons/new", :controller => "pokemons", :action => "new"
  post "/create_pokemon", :controller => "pokemons", :action => "create"

  # READ
  get "/pokemons", :controller => "pokemons", :action => "index"
  get "/pokemons/:id", :controller => "pokemons", :action => "show"

  # UPDATE
  get "/pokemons/:id/edit", :controller => "pokemons", :action => "edit"
  post "/update_pokemon/:id", :controller => "pokemons", :action => "update"

  # DELETE
  get "/delete_pokemon/:id", :controller => "pokemons", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
