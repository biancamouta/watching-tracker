class GeneralsController < ApplicationController
    def index
        @generals = General.order :name
        @nexts = General.order :next_episode_at
    end

    def new
        @general = General.new
    end

    def create
        #requisicao dos valores que ficam na url
        general = params.require(:general).permit(:name, :status, :season, :episode, :next_episode_at) 
        @general = General.new general
        if general.save
            flash[:notice] = "Saved!"
            redirect_to root_url
        else
            render :new
        end
    end

    def destroy
        id = params[:id]
        General.destroy id
        redirect_to root_url
    end

    def search
        @name = params[:name]
        @generals = General.where "name like?", "%#{@name}%" 
    end

end
