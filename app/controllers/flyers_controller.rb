class FlyersController < ApplicationController
	
  def index
    @flyer = Flyer.all
    respond_to do |format|
    format.html
    format.pdf do
      pdf = PDF::Writer.new
      pdf.text "text"
      # send_data FlyerDrawer.draw(@flyers), :filename => 'flyer.pdf', :type => 'application/pdf', :disposition => 'inline'
    end
  end
  end

  def new
    @flyer = Flyer.new
  end

  def create
    @flyer = Flyer.new(flyer_params)
  
    respond_to do |format|
      if @flyer.save
        format.html { redirect_to @flyer, notice: 'A flyer was successfully created.' }
        format.json { render :show, status: :created, location: @flyer }
      else
        format.html { render :new }
        format.json { render json: @flyer.errors, status: :unprocessable_entity }
      end
    end
  end

  def show 
    @flyer = find_flyer

end

  def edit
    @flyer = find_flyer
  end
  
  def update
    @flyer = find_flyer
    respond_to do |format|
      if @flyer.update(flyer_params)
        format.html { redirect_to @flyer, notice: 'Flyer was successfully updated.' }
        format.json { render :show, status: :ok, location: @flyer }
      else
        format.html { render :edit }
        format.json { render json: @flyer.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @flyer = find_flyer
    @flyer.destroy
    respond_to do |format|
      format.html { redirect_to flyers_url, notice: 'Flyer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_flyer
    Flyer.find(params[:id])
  end


  def flyer_params
    params.require(:flyer).permit(:title, :address, :description, :contact, :image)
  end


end
