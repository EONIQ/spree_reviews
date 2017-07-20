Spree::User.class_eval do 
  def buyer_of?(product)
    admin? || orders.flat_map(&:inventory_units).flat_map(&:variant).flat_map(&:product).compact.uniq.flat_map(&:id).include?(product.id)
  end
end