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
    @game = Game.find(drawing_params[:game_id])
    puts "***************************************
          #{@game}
          ***************************************"
    @drawing = Drawing.find(drawing_params[:id])
    puts "***************************************
          #{@drawing}
          ***************************************"
    @drawing.draw = drawing_params[:draw]
    @drawing.color = drawing_params[:color]
    @drawing.lineWidth = drawing_params[:lineWidth]
    @drawing.plots = params[:plots]
    puts "***************************************
          #{params}
          ***************************************"
    if @drawing.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        DrawingSerializer.new(@drawing)
      ).serializable_hash
      DrawingsChannel.broadcast_to @drawing, serialized_data
    end
  end

  private

  def drawing_params
    params.require(:drawing).permit(:plots, :id, :game_id, :draw, :color, :lineWidth)
  end
end
