class ListsController < ApplicationController
  before_action :find_list, only: [:show, :destroy]

  def index
    @lists = List.all
  end

def show
  @bookmark = Bookmark.new
end

def new
  @list = List.new
end

def create
  @list = List.new(list_params)
  if @list.save
    @list.photo.attach(list_params[:photo])

    redirect_to lists_url
  else
    render :new
  end
end

def destroy
  @list.destroy
  redirect_to lists_url
end

private

def find_list
  @list = List.find(params[:id])
end

def list_params
  params.require(:list).permit(:name, :photo)
end

end
