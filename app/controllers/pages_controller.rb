class PagesController < ApplicationController
  def home
    @photos = Photo.for_home.with_attached_image.shuffle
  end

  def informations; end

  def contact
    @contact = Contact.new(params.require(:contact).permit(:email, :content))
    if @contact.save

      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: {
          success: true,
          contact: @contact,
          errors: @contact.errors
          }
        }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: {
          success: false,
          errors: @contact.errors
          }
        }
      end
    end
  end
end
