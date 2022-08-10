# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class
require 'pry'
class User
    attr_accessor :name
    def initialize(name)
        @name = name
        
    end
    def photos
        Photo.all.filter do |p|
            p.user.name == @name
        end
    end
    


end



class Photo 
    attr_accessor :user
    attr_reader :comments
    @@all = []
    def initialize
        @user = nil
        @@all << self
        @comments = []
    end
    def self.all
        @@all

    end
    def make_comment(comment)
        @comments << Comment.new(comment) 

        

    end
    


end




class Comment
    @@all = []
    def initialize(comment)
        @@all << self

    end
    def self.all
        @@all
    end


end
binding.pry


sandwich_photo = Photo.new
sophie = User.new("Sophie")
sandwich_photo.user = sophie
sandwich_photo.user.name
# => "Sophie"
sophie.photos
# => [#<Photo:0x00007fae2880b370>]


sandwich_photo.comments
# => []

sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]

Comment.all
#=> [#<Comment:0x00007fae28043700>]
