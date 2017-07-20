class Spree::ReviewsAbility
  include CanCan::Ability

  def initialize(user)
    review_ability_class = self.class
    can :create, Spree::Review do |review|
      (review_ability_class.allow_anonymous_reviews? || !user.email.blank?) && 
      (review_ability_class.allow_non_buyer_reviews? || user.buyer_of?(review.product))
    end
    can :create, Spree::FeedbackReview do |review|
      review_ability_class.allow_anonymous_reviews? || !user.email.blank?
    end
  end

  def self.allow_anonymous_reviews?
    !Spree::Reviews::Config[:require_login]
  end

  def self.allow_non_buyer_reviews?
    Spree::Reviews::Config[:non_buyer_review]
  end
end
