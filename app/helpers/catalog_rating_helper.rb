module CatalogRatingHelper

  def CalculateRating(catid)
    @prod = Category.find(catid).products
    overall_rate = 0
    size = 0
    @prod.each do |p|
      ratingAndSize = CalProductRate(p.id)
      overall_rate += ratingAndSize[0]
      size += ratingAndSize[1]
    end
    overall_rate / size
  end

  def CalProductRate(prodid)
    reviews = Product.find(prodid).reviews
    rate = 0
    size = reviews.size
    reviews.each do |r|
      rate += r.rating.to_f
    end
    return rate, size
  end

end
