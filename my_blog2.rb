class Blog
    @@all_posts = Array.new
#is this initializing @@all_posts? Or does it just make it easier to call? 
 
    @@num_posts = 0
    
    def self.add(post)
        @@num_posts += 1
        @@all_posts << post
    end
    
    def self.publish
        puts "Here are all #{@@num_posts} of your posts."
        @@all_posts.each do |post|
#post below refers to what's in the chute above, which is a local variable, which refers to each individual item
            puts "Title: \n #{post.title}" 
            puts "Author: \n "
        end
    end
end
#what does it mean to initialize a class variable? How can one call on the parent class variable inside the child class?
class BlogPost < Blog
    attr_accessor :title, :author, :content, :publish_date
#set title, content, publish date, author? for each NEW post
#need to have the self. below because the following post = new would not work. This shows it's a class level method, otherwise it may just be run on an instance of a class but not on a class.
    def self.create
#no @ means it's only being used inside this method, it's a local variable
        post = BlogPost.new
        puts "What's the title of your post?"
        post.title = gets.chomp.capitalize
        puts "Who are you?"
        post.author = gets.chomp.capitalize
        puts "What's the content of your post?"
        post.content = gets.chomp
        post.publish_date = Time.now
        Blog.add(self)
        puts "Do you want to create another blog post? [Y/N]"
        new if gets.chomp.downcase == "y"
    end
end
BlogPost.create
BlogPost.publish