class PagesController < ApplicationController
  def home
    @photos = Photo.for_home.with_attached_image.shuffle
  end

  def informations; end

  def contact
    @contact = Contact.new(params.require(:contact).permit(:email, :content))

    unless verify_recaptcha?(params[:recaptcha_token], 'contact')
      respond_to do |format|
        format.html do
          redirect_to root_path
        end
        format.json do
          html_content = render_to_string(
            partial: "shared/contact_form",
            locals: { contact: @contact, recaptcha_success: false },
            layout: false,
            formats: [:html] )
          render json: {
            html: html_content,
            success: false,
            recaptcha: false }
        end
      end
      return
    end

    if @contact.save
      respond_to do |format|
        format.html do
          redirect_to root_path
        end
        format.json do
          html_content = render_to_string(
            partial: "shared/contact_form",
            locals: { contact: Contact.new, recaptcha_success: true },
            layout: false,
            formats: [:html] )
          render json: {
            html: html_content,
            success: true,
            recaptcha: true }
        end
      end
    else
      respond_to do |format|
        format.html do
          redirect_to root_path
        end
        format.json do
          html_content = render_to_string(
            partial: "shared/contact_form",
            locals: { contact: @contact, recaptcha_success: true },
            layout: false,
            formats: [:html] )
          render json: {
            html: html_content,
            success: false,
            recaptcha: true }
        end
      end
    end
  end
end
