class DealsController < ApplicationController
  before_action :set_deal, only: [:show, :edit, :update, :destroy]
  before_action :set_stage, only: [:new, :edit]


  # GET /deals
  # GET /deals.json
  def index
    @deals = Deal.all
    # @deals = DealPolicy::Scope.new(current_user, Deal).resolve

  end

  # GET /deals/1
  # GET /deals/1.json
  def show
  end

  # GET /deals/new
  def new
    @deal = Deal.new
  end

  # GET /deals/1/edit
  def edit
  end

  # POST /deals
  # POST /deals.json
  def create
    @deal = Deal.new(deal_params)
    @deal.user = current_user
    respond_to do |format|

      if @deal.save
        format.html { redirect_to @deal, notice: 'Deal was successfully created.' }
        format.json { render :show, status: :created, location: @deal }
        format.js
      else
        format.html { render :new }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /deals/1
  # PATCH/PUT /deals/1.json
  def update
    respond_to do |format|
      if @deal.update(deal_params)
        format.html { redirect_to @deal, notice: 'Deal was successfully updated.' }
        format.json { render :show, status: :ok, location: @deal }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    @deal_id = @deal.id
    @deal.destroy
    respond_to do |format|
      format.html { redirect_to deals_url, notice: 'Deal was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deal
      @deal = Deal.find(params[:id])
    end

    def set_stage
      @stage = Stage.find(params[:stage_id]) if params[:stage_id].present?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deal_params
      params.require(:deal).permit(:company_id, :title, :total_hours, :user_id, :total_price, :stage_id, product_ids: [], notes_attributes: [:id, :title, :description, :_destroy])
    end
end
