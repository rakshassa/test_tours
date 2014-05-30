class ToursController < ApplicationController

  def index
    @tours = GetTours().order('id DESC').paginate(page: params[:page], :per_page => 10 )
  end	

  def show    
  	@tour = Tour.find(params[:id])     
  end

  def destroy    
    @tour = Tour.find(params[:id])    

    @tour.destroy
    
    respond_to do |format|      
      format.js
    end    
  end

  def create
    @tour = Tour.new(tours_params)
    @tour.user_id = current_user.id

    if @tour.save
      flash[:success] = "Created!"
      
      redirect_to tours_path
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
      redirect_to tours_path
    else      
      render 'edit'
    end
  end    

 

  private

    def tours_params
      params.require(:tour).permit(:name, :content)
    end  

    def GetTours()
      return Tour.all.limit_to_user(current_user.id)
    end
  
end