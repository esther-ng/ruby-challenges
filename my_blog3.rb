class Blog
    @@all_posts = Array.new
    @@num_posts = 0
    
    def self.add(entry)
        @@num_posts += 1
        @@all_posts << entry
    end
    
    def self.publish
        puts "Here are all #{@@num_posts} of your posts."
        @@all_posts.each do |item|
            puts "Title: #{item.title}" 
            puts "By: #{item.author}"
            puts "Published on: #{item.publish_date}"
            puts "Content: \n #{item.content}"
        end
    end
end

class BlogPost < Blog
    attr_accessor :title, :author, :content, :publish_date

    def self.create
        post = BlogPost.new
        puts "What's the title of your post?"
        post.title = gets.chomp.capitalize
        puts "Who are you?"
        post.author = gets.chomp.capitalize
        puts "What's the content of your post?"
        post.content = gets.chomp
        post.publish_date = Time.now
        BlogPost.add(post)
        puts "Do you want to create another blog post? [Y/N]"
        create if gets.chomp.downcase == "y"
    end
end
BlogPost.create
BlogPost.publish