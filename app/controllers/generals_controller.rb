class GeneralsController < ApplicationController

    before_action :set_produto, only: [:edit, :update, :destroy]

    def index
        @generals = General.order :name
    end

    def general_params
        params.require(:general).permit(:name, :status, :season, :episode, :next_episode_at) 
    end

    def new
        @general = General.new
    end

    def create
        @generals = General.new general
        if @generals.save
            flash[:notice] = "Saved!"
            redirect_to root_url
        else
            render :new
        end
    end

    def destroy
        @generals.destroy id 
        redirect_to root_url
    end

    def search
        @name = params[:name]
        @generals = General.where "name like?", "%#{@name}%" 
    end

    def status
        @generals = General.order :name
        @status = params[:status]
    end

    def edit
        render :edit
    end

    def update
        if @general.update general_params
            flash[:notice] = "Serie Atualizada"
            redirect_to root_url
        else
            render :new
        end
    end

    private

    def set_produto
        @general = General.find (params[:id])
    end

end
