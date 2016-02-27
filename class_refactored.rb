class Pet
    attr_accessor :name
end
class Dog < Pet
    attr_writer :breed
    attr_reader :breed
    def bark
        return "woof"
    end
end

class Cat < Pet
    def meow
        return "mew"
    end
end
my_dog = Dog.new
my_dog.name= "Snoopy"
dog_name = my_dog.name
my_cat = Cat.new
my_cat.name= "Kitty"
cat_name = my_cat.name
puts "#{dog_name} says #{my_dog.bark}. #{cat_name} says #{my_cat.meow}."