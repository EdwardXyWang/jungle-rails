class CategoriesController < ApplicationController
  include CatalogRatingHelper

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

end
