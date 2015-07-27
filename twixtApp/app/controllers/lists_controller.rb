class ListsController < ApplicationController
  before_action :find_group, only: [:index, :new, :create]
  before_action :find_list, except: [:index, :new, :create]

  def index
    @lists = @group.lists
  end

  def new
    @list = List.new
  end

  def create
    @list = @group.lists.create list_params
    @list.save
    redirect_to group_lists_path(@group)
  end

  def edit
  end

  def update
    @list.update list_params
    @list.save
    redirect_to list_path
  end
  
  def show
  end

  def destroy
    @list.destroy
    redirect_to group_lists_path(@list)
  end

  private

    def list_params
      params.require(:list).permit(:name, :created)
    end

    def find_list
      @list = List.find_by_id params[:id]
    end

    def find_group 
      @group = Group.find_by_id params[:group_id]
    end
end