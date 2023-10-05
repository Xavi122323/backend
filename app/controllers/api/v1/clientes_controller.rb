class Api::V1::ClientesController < ApplicationController
  
  def index
    clientes = Cliente.all()
    render json:clientes, status: 200
  end

  def show
    client = Cliente.find_by(params[:id])
    if client
      render json:client, status: 200
    else
      render json: {error: "Cliente no encontrado"}
    end
  end

  def new
    client = Cliente.new
  end

  def create
    client = Cliente.new(
      name: client_params[:name], 
      email: client_params[:email], 
      identification: client_params[:identification])

    if client.save
      render json:client, status:200
    else
      render json:{error: "no se pudo ingresar"}
    end
  end

  def update
    client = Cliente.find(params[:id])

    if client
      client.update(name: params[:name], email: params[:email], identification: params[:identification])
      render json: "Actualizado exitosamente"
    else
      render json:{error: "no se pudo actualizar"}
    end
  end

  def destroy
    client = Cliente.find(params[:id])
    if client
      client.destroy
      render json: "Eliminado exitosamente"
    end
  end

  private
    def client_params
      params.require(:client).permit(:name, :email, :identification)
    end
end
