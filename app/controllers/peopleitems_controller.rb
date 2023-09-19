class PeopleitemsController < ApplicationController
  before_action :set_peopleitem, only: %i[ show update destroy ]

  def people_generate
    system("bash public/addPeopleitems.sh")
    render "generate_peopleitems"
    # redirect_to peopleitems_url
  end

  def people_delete
    system("bash public/removePeopleitems.sh")
    render "delete_peopleitems"
    # redirect_to peopleitems_url
  end

  # GET /peopleitems or /peopleitems.json
  def index
    @peopleitems = Peopleitem.all
  end

  # def open
  #   openhab_client = OpenhabClient.new
  #   @items = openhab_client.fetch_items
  #   render json: @items
  # end

  # GET /peopleitems/1 or /peopleitems/1.json
  def show
  end
  
  # GET /peopleitems/new
  def new
    @peopleitem = Peopleitem.new
  end

  # GET /peopleitems/1/edit
  def edit

    @peopleitem = Peopleitem.all
  end

  # POST /peopleitems or /peopleitems.json
  def create
    @peopleitem = Peopleitem.new(peopleitem_params)

    respond_to do |format|
      if @peopleitem.save
        format.html { redirect_to peopleitem_url(@peopleitem), notice: "Peopleitem was successfully created." }
        format.json { render :show, status: :created, location: @peopleitem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @peopleitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /peopleitems/1 or /peopleitems/1.json
  def update
    respond_to do |format|
      if @peopleitem.update(peopleitem_params)
        format.html { redirect_to peopleitem_url(@peopleitem), notice: "Peopleitem was successfully updated." }
        format.json { render :show, status: :ok, location: @peopleitem }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @peopleitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peopleitems/1 or /peopleitems/1.json
  def destroy
    @peopleitem.destroy

    respond_to do |format|
      format.html { redirect_to peopleitems_url, notice: "Peopleitem was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peopleitem
      @peopleitem = Peopleitem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def peopleitem_params
      params.require(:peopleitem).permit(:people_id, :name, :label, :plate)
    end
end
