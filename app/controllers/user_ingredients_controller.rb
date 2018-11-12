class UserIngredientsController < ApplicationController
  before_action :set_user_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /user_ingredients
  # GET /user_ingredients.json
  def index
    data =  if params[:user_parent_group].present?
               {data: UserIngredient.includes(:ingredient).joins(:ingredient).where(user_id: params[:user_id]).map{|x| {id: x.ingredient_parent_id, name: x.ingredient_parent_name}}.uniq}
            else
              UserIngredient.joins(:ingredient).where("parent_id = ?", params[:parent_id]).where(user_id: params[:user_id]).as_json(methods: :ingredient_name)
            end
    render json: data
  end

  # GET /user_ingredients/1
  # GET /user_ingredients/1.json
  def show
  end

  # GET /user_ingredients/new
  def new
    @user_ingredient = UserIngredient.new
  end

  # GET /user_ingredients/1/edit
  def edit
  end

  # POST /user_ingredients
  # POST /user_ingredients.json
  def create
    ui = UserIngredient.find_or_initialize_by(user_ingredient_new_params)
    ui.quanity = ui.quanity.to_i + params[:quanity].to_i
    ui.save
    @user_ingredient = ui

    respond_to do |format|
      if @user_ingredient.save
        format.html { redirect_to @user_ingredient, notice: 'User ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @user_ingredient }
      else
        format.html { render :new }
        format.json { render json: @user_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_ingredients/1
  # PATCH/PUT /user_ingredients/1.json
  def update
    respond_to do |format|
      if @user_ingredient.update(user_ingredient_params)
        format.html { redirect_to @user_ingredient, notice: 'User ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_ingredient }
      else
        format.html { render :edit }
        format.json { render json: @user_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_ingredients/1
  # DELETE /user_ingredients/1.json
  def destroy
    @user_ingredient.destroy
    respond_to do |format|
      format.html { redirect_to user_ingredients_url, notice: 'User ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_ingredient
      @user_ingredient = UserIngredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_ingredient_params
      params.permit(:user_id, :ingredient_id, :quanity)
    end
    def user_ingredient_new_params
      params.permit(:user_id, :ingredient_id)
    end
end
