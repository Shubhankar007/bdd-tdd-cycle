class Movie < ActiveRecord::Base

  attr_accessible :title, :rating, :director, :description, :release_date

  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.to_csv(all_products)
    CSV.generate do |csv|
      csv << column_names
      all_products.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end
end