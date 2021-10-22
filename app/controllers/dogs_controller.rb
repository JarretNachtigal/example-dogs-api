class DogsController < ApplicationController
  def create
    if current_user
      dog = Dog.new(
        name: params[:name],
        age: params[:age],
        breed: params[:breed]
      )
      #validation
      if dog.save
        render json: dog.as_json
      else
        render json: {message: "bad dog"}
      end
    else
      render json: {message: "please log in mr gamer boi"}
    end
  end
end
