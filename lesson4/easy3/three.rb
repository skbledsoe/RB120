class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

cat1 = AngryCat.new(16, 'lily')
cat2 = AngryCat.new(8, 'fizz')

cat1.age
cat1.name
cat2.age
cat2.name