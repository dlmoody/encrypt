class Student
    attr_accessor :first_name, :last_name, :primary_phone_number
    
    def intro(target)
        puts "Hi #{target}, my name is #{first_name}"
    end
end


dave = Student.new
dave.first_name = "David"
dave.intro("john")
