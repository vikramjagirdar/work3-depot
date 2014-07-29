class RatesController < ApplicationController
  skip_before_filter :authorize, only: [:create, :new, :index]
  # GET /rates
  # GET /rates.json
  def index
    @rates = Rate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rates }
    end
  end

  # GET /rates/1
  # GET /rates/1.json
  def show
    @rate = Rate.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rate }
    end
  end

  # GET /rates/new
  # GET /rates/new.json
  def new
    if(current_user)
      @rate = Rate.new
      var = params[:product_id] 
      @rate.product_id = var
      temp = current_user
      @rate.user_id = temp
    else
      redirect_to store_url, notice: "Please login to rate this product"
      return
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rate }
    end
  end

  # GET /rates/1/edit
  def edit
    @rate = Rate.find(params[:id])
    if(@rate.user_id != session[:user_id])
      redirect_to login_url
      return
    end
  end

  # POST /rates
  # POST /rates.json
  def create
    
    @rate = Rate.new(params[:rate])
      # byebug 
    respond_to do |format|
      if @rate.save

        format.html { redirect_to store_url, notice: 'Rate was successfully created.' }
        format.json { render json: @rate, status: :created, location: @rate }
      else
        format.html { render action: "new" }
        format.json { render json: @rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rates/1
  # PUT /rates/1.json
  def update
    @rate = Rate.find(params[:id])

    respond_to do |format|
      if @rate.update_attributes(params[:rate])
        format.html { redirect_to store_url, notice: 'Rate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rates/1
  # DELETE /rates/1.json
  def destroy
    @rate = Rate.find(params[:id])
    @rate.destroy

    respond_to do |format|
      format.html { redirect_to rates_url }
      format.json { head :no_content }
    end
  end
end
