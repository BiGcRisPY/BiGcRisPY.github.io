class TmsController < ApplicationController
  def index
    @tms = Tm.all

    render("tms/index.html.erb")
  end

  def show
    @tm = Tm.find(params[:id])

    render("tms/show.html.erb")
  end

  def new
    @tm = Tm.new

    render("tms/new.html.erb")
  end

  def create
    @tm = Tm.new

    @tm.move_id = params[:move_id]

    save_status = @tm.save

    if save_status == true
      redirect_to("/tms/#{@tm.id}", :notice => "Tm created successfully.")
    else
      render("tms/new.html.erb")
    end
  end

  def edit
    @tm = Tm.find(params[:id])

    render("tms/edit.html.erb")
  end

  def update
    @tm = Tm.find(params[:id])

    @tm.move_id = params[:move_id]

    save_status = @tm.save

    if save_status == true
      redirect_to("/tms/#{@tm.id}", :notice => "Tm updated successfully.")
    else
      render("tms/edit.html.erb")
    end
  end

  def destroy
    @tm = Tm.find(params[:id])

    @tm.destroy

    if URI(request.referer).path == "/tms/#{@tm.id}"
      redirect_to("/", :notice => "Tm deleted.")
    else
      redirect_to(:back, :notice => "Tm deleted.")
    end
  end
end
