class Api::CategoriesController < ApplicationController
  def index
    categories = Category.all

    render json: categories.map { |category| category_response(category) }
  end

  private

  def category_response(category)
    {
      id: category.id,
      name: category.name,
      icon: category.icon
    }
  end
end
