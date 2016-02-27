class Blog
#sets empty array
    @@all_blog_posts = []
#sets up the count
    @@num_blog_posts = 0
#sets up method to call the array
    def self.all
        @@all_blog_posts
    end
#class method to save the blog post to the array   
    def self.add(thing)
#pushes the post into the array
        @@all_blog_posts << thing
#increases post count everytime it saves
        @@num_blog_posts += 1
    end
#class method to publish all posts    
    def self.publish
        @@all_blog_posts.each do |post|
            puts "Title:\n #{post.title}"
            puts "Body:\n #{post.content}"
            puts "Publish Date:\n #{post.created_at}"
        end  
    end
end


class BlogPost < Blog
#creates new method instead of changing .new method?
    def self.create
#what does post=new do? post defined above? does this name the new instance object "post"??
        post = new
        puts "Name your blog post:"
        post.title = gets.chomp
        puts "Your blog post content:"
        post.content = gets.chomp
        post.created_at = Time.now
#what does post.save do, defined below? Calls on the method below that adds the post to the array
        post.save
        puts "Do you want to create another post? [Y/N]"
#note the shorter code
        create if gets.chomp.downcase == 'y'
    end
#why is it defined this way? this defines local/instance variables so they may be used outside... if post is the name of the object, post.method will call up the content? 
    def title
        @title
    end
    
    def title=(title)
        @title = title
    end
    def created_at=(created_at)
        @created_at = created_at
    end
    def content
        @content
    end
    def content=(content)
        @content = content
    end
    def save
#this refers to the parent method? Save adds the post to the array
        BlogPost.add(self)
    end
end

BlogPost.create
all_blog_posts = BlogPost.all
puts all_blog_posts.inspect
BlogPost.publish
    
