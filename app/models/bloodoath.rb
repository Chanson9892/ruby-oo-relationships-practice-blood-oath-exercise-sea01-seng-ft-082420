class BloodOath
    attr_reader :cult, :follower, :initiation_date
    
    @@all = []

    def initialize(cult, follower)
        @cult = cult 
        @follower = follower
        @initiation_date = "_#{Time.now.year}-#{Time.now.month}-#{Time.now.day}_."
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        self.all.sort_by do |oath|
            oath.initiation_date
        end
    end



end