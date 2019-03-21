class DrawingSerializer < ActiveModel::Serializer
  attributes :id, :game_id, :draw, :plots, :color, :lineWidth
  belongs_to :game
end
