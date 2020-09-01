class Cult
    attr_reader :name, :location, :founding_year, :slogan

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year.to_i
        @slogan = slogan
        @@all << self
    end

    def self.all
        @@all
    end

    #takes in an argument of a `Follower` 
    #instance and adds them to this cult's list of followers
    def recruit_follower(follower)
        BloodOath.new(self, follower)
    end

    #selects the bloodoaths associated to this cult
    def bloodoaths
        BloodOath.all.select do |oath| 
            oath.cult == self
        end
    end

    #returns the followers of the cult
    def cult_population
        self.bloodoaths.length
    end
    
    #returns the cult that matches cult_name
    def self.find_by_name(cult_name)
        self.all.find do |cult| 
            cult.name == cult_name
        end
    end

    #returns the cult that matches location_name
    def self.find_by_location(location_name)
        self.all.find do |cult| 
            cult.location == location_name
        end
    end

    #returns the cult that matches year
    def self.find_by_founding_year(year)
        self.all.find do |cult| 
            cult.founding_year == year
        end
    end

    #returns a `Float` that is the average age of this cult's 
    def average_age
        total_age = self.bloodoaths.inject(0) do |sum, cult| 
            sum += cult.follower.age
        end
        total_age.to_f/self.bloodoaths.length
    end

    #prints out all of the mottos for this cult's followers
    def my_followers_mottos
        self.bloodoaths.map do |oath|
            oath.follower.life_motto
        end
    end

    #returns the `Cult` instance who has the least number of followers
    def self.least_popular
        self.all.min_by do |cult|
            cult.cult_population
        end
    end

    #returns a `String` that is the location with the most cults
    def self.most_common_location
        #puts the locations in hash and gives a counter value of cults there
        most_common = self.all.inject(Hash.new(0)) do |hash, cult| 
            hash[cult.location] += 1 
            hash
        end
        #finds the location with max cults and returns location and #cults there
        most_common.max_by do |location, number| 
            number
        end
    end

end