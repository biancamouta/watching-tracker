class GeneralsController < ApplicationController
    def index
        @generals = General.order :name
        @nexts = General.order :next_episode_at
    end

    def general_params
        params.require(:general).permit(:name, :status, :season, :episode, :next_episode_at) 
    end

    def new
        @general = General.new
    end

    def create
        #requisicao dos valores que ficam na url
        @general = General.new general
        if @general.save
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

    def status
        @generals = General.order :name
        @status = params[:status]
    end

    def edit
        id = params[:id]
        @general = General.find(id)  #usa o @ pq precisa exibir na hora da edicao
        render :new
    end

    def update
        id = params[:id]
        @general = General.find(id)
        if @general.update general_params
            flash[:notice] = "Serie Atualizada"
            redirect_to root_url
        else
            render :new
        end
    end

end
