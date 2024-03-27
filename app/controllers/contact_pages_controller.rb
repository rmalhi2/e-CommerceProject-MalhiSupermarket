class ContactPagesController < ApplicationController
    def show
      @contact_page = ContactPage.first
    end
  
    def edit
      @contact_page = ContactPage.first
    end
  
    def update
      @contact_page = ContactPage.first
      if @contact_page.update(contact_page_params)
        redirect_to contact_page_path, notice: 'Contact page updated successfully.'
      else
        render :edit
      end
    end
  
    private
  
    def contact_page_params
      params.require(:contact_page).permit(:title, :phone, :email, :address)
    end
  end
  