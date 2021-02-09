require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'able to create new product' do
      @category = Category.new(:name=>"test")
      @product = Product.new(
        :category=>@category,
        :name => "TestName",
        :price=>123,
        :quantity=>123
      )
      @product.save
      expect(@product).to be_present
    end
    it 'must have a name' do
      @category = Category.new(:name=>"test")
      @product = Product.new(
        :category=>@category,
        :price=>123,
        :quantity=>123
      )
      @product.save
      expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
    end
    it 'must have a price' do
      @category = Category.new(:name=>"test")
      @product = Product.new(
        :category=>@category,
        :name=>"TestName",
        :quantity=>123
      )
      @product.save
      expect(@product.errors.full_messages[0]).to eq("Price cents is not a number")
    end
    it 'must have a quantity' do
      @category = Category.new(:name=>"test")
      @product = Product.new(
        :category=>@category,
        :name=>"TestName",
        :price=>123
      )
      @product.save
      expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")
    end
    it 'must have a category' do
      @category = Category.new(:name=>"test")
      @product = Product.new(
        :quantity=>123,
        :name=>"TestName",
        :price=>123
      )
      @product.save
      expect(@product.errors.full_messages[0]).to eq("Category can't be blank")
    end
  end
end
