module Spree
  class FeedbackReviewSerializer < ApplicationSerializer    
    attributes :id, :rating, :created_at, :updated_at
  end
end
