module CalculateProductRatingHelper

  def CalculateProductRate(prodid)
    reviews = Product.find(prodid).reviews
    rate = 0
    size = reviews.size
    reviews.each do |r|
      rate += r.rating.to_f
    end

    if size != 0
      rate / size
    else
      false
    end
  end

end
