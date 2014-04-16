class ToursController < ApplicationController

  def index
    @tours = GetTours().order('id DESC').paginate(page: params[:page], :per_page => 10 )
  end	

  def show    
  	@tour = Tour.find(params[:id])     
  end

  def destroy    
    @tour = Rfqform.find(params[:id])    

    @rfqform.destroy
    
    respond_to do |format|      
      format.js
    end    
  end

  def create
    @tour = Tour.new(tours_params)

    if @rfqform.save
      flash[:success] = "Created!"
      
      redirect_to @tour
    else
      render 'new'
    end
  end

  def new   
  	@tour = Tour.new 
  end  

  def edit
    @tour = Tour.find(params[:id])
  end  

  def update  
    @tour = Tour.find(params[:id])
    
    if @tour.update_attributes(tours_params)    
      flash[:success] = "Updated"
      redirect_to @tour
    else      
      render 'edit'
    end
  end    

 

  private

    def rfqforms_params
      params.require(:tour).permit(:name)
    end  

    def GetTours()
      return Tour.all.limit_to_user(current_user.id)
    end
  
end