class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

#what would the output be?
tv = Television.new
tv.manufacturer  #error, as manufacturer is a class method
tv.model #code within model method would execute

Television.manufacturer  #code within manufacturer method would execute
Television.model  #error, model method is an instance method