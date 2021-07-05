class Show < ActiveRecord::Base


    def self.highest_rating

        return self.all.maximum(:rating)
    end 

    def self.most_popular_show 

        return self.where("rating=?", self.highest_rating).first 
    end 

    def self.lowest_rating

        return self.all.minimum(:rating)
    end 

    def self.least_popular_show

        return self.where("rating = ?", self.lowest_rating).first 
    end 

    def self.ratings_sum

        rating_counter = 0
        self.all.each {|show| rating_counter += show.rating }
        return rating_counter 
    end 

    def self.popular_shows 

        return self.all.where("rating >=? ", 5 )
    end 

    def self.shows_by_alphabetical_order

        return self.all.order(name: :asc)
    end 

end 