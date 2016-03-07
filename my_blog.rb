class Blog
    @@all_posts = Array.new
#is this initializing @@all_posts? Or does it just make it easier to call? 
    def self.all
        @@all_posts
    end
    end
    def self.count
        @@all_posts.count
    end
    def self.publish
        puts @@all_posts
    end
end
#uninitialized means it hasn't been created or had a value yet
#what does it mean to initialize a class variable? How can one call on the parent class variable inside the child class?
class BlogPost < Blog
#set title, content, publish date, author? for each NEW post
    def self.new
        puts "What's the title of your post?"
        @title = gets.chomp.capitalize
        puts "Who are you?"
        @author = gets.chomp.capitalize
        puts "What's the content of your post?"
        @content = gets.chomp
        publish_date = Time.now
        @publish_date = publish_date
        Blog.all.push("Title: #{@title}\n By: #{@author}\n Published: #{publish_date}\n Content:\n #{@content}")
        Blog.num += 1
        puts "Do you want to create another blog post? [Y/N]"
        answer = gets.chomp.downcase
        if (answer == "y")
            BlogPost.new
        else
        end
    end
end
BlogPost.new
puts Blog.all
puts Blog.num
puts Blog.count
Blog.publish