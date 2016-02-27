class Pet
    def set_name=(name)
        @name = name
    end
    def get_name
        return @name
    end
end
class Dog < Pet
    def set_breed=(dog_breed)
        @dog_breed = dog_breed
    end
    def get_breed
        @dog_breed = dog_breed
    end
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
my_dog.set_name= "Snoopy"
dog_name = my_dog.get_name
my_cat = Cat.new
my_cat.set_name= "Kitty"
cat_name = my_cat.get_name
puts "#{dog_name} says #{my_dog.bark}. #{cat_name} says #{my_cat.meow}."