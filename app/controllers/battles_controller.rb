class BattlesController < ApplicationController
  def index
    @battles = Battle.all

    render("battles/index.html.erb")
  end

  def show
    @battle = Battle.find(params[:id])

    render("battles/show.html.erb")
  end

  def new
    @battle = Battle.new

    render("battles/new.html.erb")
  end

  def create
    @battle = Battle.new

    @battle.offense_id = params[:offense_id]
    @battle.defense_id = params[:defense_id]
    @battle.effectiveness = params[:effectiveness]

    save_status = @battle.save

    if save_status == true
      redirect_to("/battles/#{@battle.id}", :notice => "Battle created successfully.")
    else
      render("battles/new.html.erb")
    end
  end

  def edit
    @battle = Battle.find(params[:id])

    render("battles/edit.html.erb")
  end

  def update
    @battle = Battle.find(params[:id])

    @battle.offense_id = params[:offense_id]
    @battle.defense_id = params[:defense_id]
    @battle.effectiveness = params[:effectiveness]

    save_status = @battle.save

    if save_status == true
      redirect_to("/battles/#{@battle.id}", :notice => "Battle updated successfully.")
    else
      render("battles/edit.html.erb")
    end
  end

  def destroy
    @battle = Battle.find(params[:id])

    @battle.destroy

    if URI(request.referer).path == "/battles/#{@battle.id}"
      redirect_to("/", :notice => "Battle deleted.")
    else
      redirect_to(:back, :notice => "Battle deleted.")
    end
  end
end
