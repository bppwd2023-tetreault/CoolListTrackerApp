class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy archive ]
  before_action :authenticate_user!

  # GET /lists or /lists.json
  def index
    @lists = List.all
    authorize @lists
  end

  # GET /lists/1 or /lists/1.json
  def show
    authorize @list
  end

  # GET /lists/new
  def new
    @list = List.new
    if @group
      @group = Group.find(params[:id]) # id is the group id, not list id
    end
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists or /lists.json
  def create
    @list = List.new(list_params)
    @list.archived = false

    respond_to do |format|
      if @list.save
        format.html { redirect_to list_url(@list), notice: "List was successfully created." }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to list_url(@list), notice: "List was successfully updated." }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.destroy

    respond_to do |format|
      format.html { redirect_to lists_url, notice: "List was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def archive
    puts "\n\n\n\n"
    puts params
    puts "\n\n\n\n"
    if @list.archived == false
      @list.archived = true
    elsif @list.archived == true
      @list.archived = false
    end 
    @list.save
    puts @list.archived
    puts "\n\n\n\n"
    redirect_to action: "show", id: @list.id 
  end

  def archives # archive is the action to archive the list, archives is the action to view and manage the archived lists.
    @arcLists = List.where(archived: true)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:name, :list_type, :user_id, :archived, :group_id)
    end
end
