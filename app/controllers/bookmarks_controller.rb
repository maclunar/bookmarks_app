class BookmarksController < ApplicationController
  load_and_authorize_resource except: [:update, :create, :new, :edit]
  load_and_authorize_resource through: :current_user, only: [:update, :create, :new, :edit]

  # before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  # GET /bookmarks
  # GET /bookmarks.json
  def index
		if params[:tag]
			@bookmarks = Bookmark.tagged_with(params[:tag])
		else
    	@bookmarks = Bookmark.all
		end
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.json
  def show
  end

  # GET /bookmarks/new
  def new
    render layout: false
  end

  # GET /bookmarks/1/edit
  def edit
    render layout: false
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    # @bookmark = current_user.bookmarks.new(bookmark_params)

    respond_to do |format|
      if @bookmark.save

        @bookmark.update_domain
        @bookmark.generate_short_url

        # user_sign_in?
        # current_user.bookmarks

        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully created.' }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { render :new }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmarks/1
  # PATCH/PUT /bookmarks/1.json
  def update
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookmark }
      else
        format.html { render :edit }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_params
      params.require(:bookmark).permit(:name, :url, :domain_id, :user_id,
										 :shortened_id, :tag_list)
    end
end
