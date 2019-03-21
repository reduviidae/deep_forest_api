class Api::V1::DrawingsController < ApplicationController
  def index
    @drawings = Drawing.all
    render json: @drawings
  end

  def show
    @drawing = Drawing.find(params[:id])
    render json: @drawing
  end

  def create
    @drawing = Drawing.new(drawing_params)
    if @drawing.save
      render json: @drawing
    end
  end

  def draw
    @drawing = Drawing.find(params[:id])
    @drawing.draw = params[:draw]
    @drawing.color = params[:color]
    @drawing.lineWidth = params[:lineWidth]
    @drawing.plots = params[:plots]
    if @drawing.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        DrawingSerializer.new(@drawing)
      ).serializable_hash
      DrawingsChannel.broadcast_to @game, serialized_data
      head :ok
    end
  end

  private

  def drawing_params
    params.require(:drawing).permit(:game_id, :draw, :plots, :color, :lineWidth)
  end
end
