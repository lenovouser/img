class ImagesController < ApplicationController

  def create
    @image = Image.new(image_params)
    @image.remote_addr = request.remote_ip
    @image.session = current_session
    @image.save
    respond_to do |f|
      f.html do
        flash[:notice] = 'The image has been created successfully'
        redirect_to image_path(@image.token)
      end
      
      f.json do
        render :json => {
          :thumbnail => @image.image.url(:thumb),
          :link => image_path(@image.token)
        }
      end
    end
  end

  def show
    @image = Image.where(:token => params[:id]).first
  end

  def destroy
    @image = Image.where(:token => params[:id]).first
    @image.destroy
    flash[:notice] = 'The image has been deleted successfully'
    redirect_to images_path
  end

  private

  def image_params
    params.require(:image).permit(:image)
  end

end