class ConsolesController < ApplicationController

    def index
        consoles = Console.all
        render json: consoles
    end

    def games_index
        console = Console.find(params[:console_id])
        games = console.games.uniq
        render json: games
    end

    def users_consoles
        consoles = current_user.consoles.uniq
        render json: consoles
    end

    def user_games_index
        console = current_user.consoles
        games = current_user.games.where("console_id = ?", params[:console_id])
        render json: games
    end

    def create
        console = Console.create(console_params)
        if console.valid?
            render json: console
        else
            render json: { errors: console.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def current_user
        User.find_by(id: session[:user_id])
    end

    def current_console
        console = Console.find(params[:console_id])
    end

    def console_params
        params.permit(:model, :year, :storage)
    end 
end
