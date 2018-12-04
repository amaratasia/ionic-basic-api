class PastHistoriesController < ApplicationController
  before_action :set_past_history, only: [:show, :edit, :update, :destroy]

  # GET /past_histories
  # GET /past_histories.json
  def index
    past_histories = PastHistory.where(user_id: params[:user_id])
    render json: past_histories.as_json(include: :recipe, only: :created_at)
  end

  # GET /past_histories/1
  # GET /past_histories/1.json
  def show
  end

  # GET /past_histories/new
  def new
    @past_history = PastHistory.new
  end

  # GET /past_histories/1/edit
  def edit
  end

  # POST /past_histories
  # POST /past_histories.json
  def create
    @past_history = PastHistory.new(past_history_params)

    respond_to do |format|
      if @past_history.save
        format.html { redirect_to @past_history, notice: 'Past history was successfully created.' }
        format.json { render :show, status: :created, location: @past_history }
      else
        format.html { render :new }
        format.json { render json: @past_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /past_histories/1
  # PATCH/PUT /past_histories/1.json
  def update
    respond_to do |format|
      if @past_history.update(past_history_params)
        format.html { redirect_to @past_history, notice: 'Past history was successfully updated.' }
        format.json { render :show, status: :ok, location: @past_history }
      else
        format.html { render :edit }
        format.json { render json: @past_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /past_histories/1
  # DELETE /past_histories/1.json
  def destroy
    @past_history.destroy
    respond_to do |format|
      format.html { redirect_to past_histories_url, notice: 'Past history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_past_history
      @past_history = PastHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def past_history_params
      params.require(:past_history).permit(:recipe_id, :user_id)
    end
end
