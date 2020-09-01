class Follower
    attr_accessor :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def self.all
        @@all
    end

    #selects the bloodoaths associated to this follower
    def bloodoaths
        BloodOath.all.select do |blood| 
            blood.follower == self
        end
    end

    #returns an `Array` of this follower's cults
    def cults
        bloodoaths.map do |cults| 
            cults.cult.name
        end
    end

    #takes in an argument of a `Cult` instance and adds this
    def join_cult(cult)
        BloodOath.new(cult, self)
    end

    def self.of_a_certain_age(follower_age)
        Follower.all.select do |follower|
            follower.age >= follower_age
        end
    end

    #prints out all of the slogans for this follower's cults
    def my_cults_slogans
        self.bloodoaths.map do |blood|
            blood.cult.slogan
        end
    end

    #returns the `Follower` instance who has joined the most cults
    def self.most_active
        self.all.max_by do |follower|
            follower.cults.count
        end
    end

    #returns the ten most active followers in an array
    def self.top_ten
        self.all.max_by(10) do |follower|
            follower.cults.count
        end
    end

end