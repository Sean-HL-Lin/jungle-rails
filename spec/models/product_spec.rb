require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "should have name" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      product1 = cat1.products.create({
        name:  nil,
        description: Faker::Hipster.paragraph(4),
        image: 'apparel1.jpg',
        quantity: 10,
        price: 64.99
      })

      expect(product1.errors.full_messages.present?).to eq(true)
      end


    it "should have price" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      product1 = cat1.products.create({
        name:  'Men\'s Classy shirt',
        description: Faker::Hipster.paragraph(4),
        image: 'apparel1.jpg',
        quantity: 10,
        price: nil
      })
      expect(product1.errors.full_messages.present?).to eq(true)
      end
    

    it "should have quantity" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      product1 = cat1.products.create({
        name:  'Men\'s Classy shirt',
        description: Faker::Hipster.paragraph(4),
        image: 'apparel1.jpg',
        quantity: nil,
        price: 64.99
      })
      expect(product1.errors.full_messages.present?).to eq(true)
      end

    it "should have category" do
      product1 = Product.create({
        name:  'Men\'s Classy shirt',
        description: Faker::Hipster.paragraph(4),
        image: 'apparel1.jpg',
        quantity: 10,
        price: 64.99
      })
      expect(product1.errors.full_messages.present?).to eq(true)
      end

  end

end
