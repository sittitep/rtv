class SeasonSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :plot, :number
end
