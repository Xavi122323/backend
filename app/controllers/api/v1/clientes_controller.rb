class Api::V1::ClientesController < ApplicationController
  
  def index
    @clientes = Cliente.all()
    render json:@clientes, status: 200
  end

  def show
    @cliente = Cliente.find_by(params[:id])
    if @cliente
      render json:@cliente, status: 200
    else
      render json: {error: "Cliente no encontrado"}
    end
  end

  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(
      name: client_params[:name], 
      email: client_params[:email], 
      identification: client_params[:identification])

    if @cliente.save
      render json:@cliente, status:200
    else
      render json:{error: "no se pudo ingresar"}
    end
  end

  def update
    @cliente = Cliente.find(params[:id])

    if @cliente
      @cliente.update(name: params[:name], email: params[:email], identification: params[:identification])
      render json: "Actualizado exitosamente"
    else
      render json:{error: "no se pudo actualizar"}
    end
  end

  def destroy
    @cliente = Cliente.find(params[:id])
    if @cliente
      @cliente.destroy
      render json: "Eliminado exitosamente"
    end
  end

  private
    def client_params
      params.require(:client).permit(:name, :email, :identification)
    end
end
