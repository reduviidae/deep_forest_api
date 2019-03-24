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
    @drawing = Drawing.first
    @drawing.draw = true
    @drawing.color = drawing_params[:color]
    @drawing.lineWidth = drawing_params[:lineWidth]
    @drawing.plots = params[:plots]
    if @drawing.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        DrawingSerializer.new(@drawing)
      ).serializable_hash
      DrawingsChannel.broadcast_to @drawing, serialized_data
    end
    @drawing.draw = false
    @drawing. save
  end

  private

  def drawing_params
    params.require(:drawing).permit(:plots, :id, :game_id, :draw, :color, :lineWidth)
  end
end
