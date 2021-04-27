class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end
  
  def new
    
  end

  def create
    @url = Url.new(permitted_url_params)

    if @url.save
      flash[:success] = 'DwarfUrl generated successfully !'
      redirect_to urls_path
    else
      flash[:alert] = @url.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @url = Url.friendly.find(params[:id])

    puts '-' * 60
    # redirect_to @url.link
    puts '-' * 60
  end

  def permitted_url_params
    params.require(:url).permit(:link, :alias).merge({ :user => current_user })
  end
end
