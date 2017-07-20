module Spree
  class FeedbackReviewSerializer < ApplicationSerializer
    cache
    
    attributes :id, :rating, :created_at, :updated_at
  end
end
