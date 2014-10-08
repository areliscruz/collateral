class FlyersController < ApplicationController
	
  def index
    @flyer = Flyer.all
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
    @flyer = Flyer.find params[:id]
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @flyer.update(awesome_params)
        format.html { redirect_to @flyer, notice: 'Flyer was successfully updated.' }
        format.json { render :show, status: :ok, location: @flyer }
      else
        format.html { render :edit }
        format.json { render json: @flyer.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @flyer.destroy
    respond_to do |format|
      format.html { redirect_to flyer_url, notice: 'Flyer was successfully destroyed.' }
      format.json { head :no_content }
  end

  private

  def flyer_params
    params.require(:flyer).permit(:title, :address, :description, :contact, :image)
  end

end 
end
