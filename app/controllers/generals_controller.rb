class GeneralsController < ApplicationController

    before_action :set_produto, only: [:edit, :update, :destroy]


    def status_name 
        if status=="cancelled"
            "Cancelled"
        elsif status=="in_progress"
            "Im Progress"
        elsif status=="done"
            "Done"
        else status=="waiting"
            "Waiting"
        end
    end 

    def index
        @generals = General.order :name
    end

    def general_params
        params.require(:general).permit( :name, :status, :season, :episode, :next_episode_at) 
    end

    def new
        @general = General.new
    end

    def create
        @generals = General.new general_params
        if @generals.save
            flash[:notice] = "Saved!"
            redirect_to root_url
        else
            render :new
        end
    end

    def destroy
        @general.general_lists.each do |general_list|
            general_list.destroy
        end
        @general.destroy
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

    def in_progress
        @generals = General.order :name
        @status = params[:status]
    end

    def cancelled
        @generals = General.order :name
        @status = params[:status]
    end

    def done
        @generals = General.order :name
        @status = params[:status]
    end

    def waiting
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

    def my_list
        @generals = General.order :name
        @my_list = params[:my_list]
    end

end
