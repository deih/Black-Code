class PagesController < InheritedResources::Base
	before_action :find_page, except: [:index, :new, :create]
	
	def index
		@pages = Page.all.order('created_at DESC')
	end

	def new
		@page = Page.new
	end

	def create
		@page = Page.new(page_params)

		if @page.save
			redirect_to @page
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @page.update(page_params)
			redirect_to @page
		else
			render 'edit'
		end
	end

	def destroy
		@page.destroy
		redirect_to root_path
	end

  private

  	def find_page
  		@page = Page.friendly.find(params[:id])
  	end

    def page_params
      params.require(:page).permit(:title, :description, :slug)
    end
end
