class User
  attr_accessor :name, :email
  
  def initialize (attributes = {})
    @name  = attributes[:name]
    @email = attributes[:email]
  end
  
  def formatted_email
    "#{@name} <#{@email}>"
  end
end


class String 
  def random
    self.split('').shuffle.join('')
  end
end


person_1 = {
  :first_name => "Adam",
  :last_name  => "Sandler"
}

person_2 = {
  :first_name => "Elisa",
  :last_name  => "Sandler"
}

person_3 = {
  :first_name => "Robert",
  :last_name  => "Sandler"
}

family = {
  :father     => person_1,
  :mother     => person_2,
  :child      => person_3
}
]