module Contentable
  extend ActiveSupport::Concern

  def self.included(base)
    base.after_commit :update_content
  end

  def update_content
    content.touch(:updated_at) if content.present?
  end
end
