module Spree
  class FeedbackReviewSerializer < ApplicationSerializer
    cache
    
    attributes :id, :rating, :created_at, :updated_at

    belongs_to :user
  end
end
