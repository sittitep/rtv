class SeasonSerializer
  include FastJsonapi::ObjectSerializer

  has_many :episodes

  attributes :title, :plot, :number

  attribute :episodes do |object|
    EpisodeSerializer.new(object.episodes.order("number ASC")).as_json
  end
end
