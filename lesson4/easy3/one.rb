class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

#case 1
hello = Hello.new
hello.hi  #hi method from Hello calls the greet method
          #located in Greeting and prints out the provided message,
          #which is "Hello"

#case2
hello = Hello.new
hello.bye #print an error message, doesn't have access to Goodbye class

#case 3
hello = Hello.new
hello.greet #prints an error message, 0 arguments are provided, 1 needed

#case 4
hello = Hello.new
hello.greet("Goodbye")  #prints "Goodbye"

#case 5
Hello.hi  #error message, hi method is not a class method