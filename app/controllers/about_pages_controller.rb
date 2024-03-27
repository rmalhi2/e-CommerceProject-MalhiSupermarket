class AboutPagesController < ApplicationController
    def show
      @about_page = AboutPage.first
    end
  
    def edit
      @about_page = AboutPage.first
    end
  
    def update
      @about_page = AboutPage.first
      if @about_page.update(about_page_params)
        redirect_to about_page_path, notice: 'About page updated successfully.'
      else
        render :edit
      end
    end
  
    private
  
    def about_page_params
      params.require(:about_page).permit(:title, :paragraph1, :paragraph2, :paragraph3, :paragraph4, :paragraph5)
    end
  end
  