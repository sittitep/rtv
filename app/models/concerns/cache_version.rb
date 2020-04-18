module CacheVersion
  def cache_key_with_version
    "#{self.class.name}-#{self.order("updated_at DESC").first.try(:updated_at).to_f}"
  end
end
