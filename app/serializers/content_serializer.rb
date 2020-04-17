class ContentSerializer
  include FastJsonapi::ObjectSerializer
  
  attribute :resource_type

  attribute :resource do |object|
    case object.resource_type
    when "Movie"
      MovieSerializer.new(object.resource).as_json
    when "Season"
      SeasonSerializer.new(object.resource).as_json
    end
  end
end
