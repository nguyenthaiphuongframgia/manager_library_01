class Admin::AuthorsController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!
  before_action :verify_admin
  before_action :load_author, except: [:create, :index, :new]

  def index
    @q = Author.search params[:q]
    @authors_all = @q.result distinct: true
    respond_to do |format|
      format.html {
        @authors = @authors_all.page(params[:page]).per Settings.per_page
      }
      format.xlsx {send_data @authors_all.to_xls,
        filename: generate_file_name( t ".authors_file_name" )}
    end
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new author_params
    if @author.save
      flash[:success] = t ".author_add_success"
      redirect_back fallback_location: admin_authors_path
    else
      render :new
    end
  end

  def update
    if @author.update_attributes author_params
      flash[:success] = t ".edit_author"
      render :edit
    else
      flash[:danger] = t ".edit_failed"
      render :edit
    end
  end

  def destroy
    if @author.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".delete_unsuccess"
    end
    redirect_back fallback_location: admin_authors_path
  end

  private
  def author_params
    params.require(:author).permit :name, :description, :image
  end

  def load_author
    @author = Author.find_by id: params[:id]
    render_404 unless @author
  end
end
