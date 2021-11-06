class PhotosController < ApplicationController
    # before_action :set_photo

    before_action :set_photo, only: [:show, :update, :destroy]
    # layout "landing"

    

    def index
        # cookie[:intentos] = 1
        # cookies[:intentos]
        # Rais.application.secret_key_base

        # session[:intentos] = 1
        # session[:intentos]

        @photos = Photo.all
        flash[:alert] = "Algo salió mal"
        # render "index", layout: "landing"
    end

    def show
        # @photo = Photo.find(params[:id])

        # render json: @photo
        respond_to do |format|
            format.html { render :show }
            format.json { render json: @photo }
            # HTML
            # JSON
            # SCRIPT js
        end
    end

    def new
        # render "nueva_vista" views/photos/nueva_vista.html.erb
        # render "carpeta/nueva_vista" views/carpeta/nueva_vista.html.erb

        session[:intentos] = session[:intentos] ? session[:intentos] + 1 : 1
        @photo = Photo.new
        @tags = Tag.all
    end

    def create
        # photo = Photo.new

        # photo.title = params[:photo][:title]
        # photo.image_url = params[:photo][:image_url]

        # filtered_params = params.fetch(:photo, {}).permit(:title, :image_url)
        # filtered_params = params.require(:photo).permit(:title, :image_url)

        @photo = Photo.new(photo_params)
        # @photo = Photo.create(params[:photo])
        # @photo = Photo.create({
        #     title: params[:photo][:title],
        #     image_url: params[:photo][:image_url]
        # })

        # photo.save
        
        # @photo.save

        respond_to do |format|
            if @photo.save
                # format.html { redirect_to @photo }
                format.html { redirect_to @photo, notice: "Todo salió bien" }
                format.json { render json: @photo, status: :created }
            else
                format.html { redirect_back fallback_location: photos_path, notice: "Algo salió mal #{@photo.errors.full_messages.to_sentence}" }
                # format.html { redirect_to photos_path, notice: "Algo salió mal #{@photo.errors.full_messages.to_sentence}" }
            end
            
        end

        # redirect_to photo
    end

    # /photos/:id/edit
    def edit
        # @id = params[:id]
        @photo = Photo.find(params[:id])
        @tags = Tag.all
    end

    # PUT/PATCH /photos/:id
    def update
        # photo = Photo.find(params[:id])

        # photo.title = params[:photo][:title]
        # photo.image_url = params[:photo][:image_url]
        # filtered_params = params.require(:photo).permit(:title, :image_url)

        @photo.update(photo_params)

        # photo.save

        # redirect_to photo, status: :moved_permanently
        redirect_to @photo
    end

    # DELETE /photos/:id
    def destroy
        # photo = Photo.find(params[:id])
        @photo.destroy

        respond_to do |format|
            format.html { redirect_to photos_path }
            format.json { head :ok }
        end
        # redirect_to "/photos"
    end

    private
        def set_photo
            # if !user
            #     redirect_to "/login"
            # end
            @photo = Photo.find(params[:id])
            
        end
        def photo_params
            params.require(:photo).permit(:title, :image_url, :todo_id, tag_ids: [])
        end
end
