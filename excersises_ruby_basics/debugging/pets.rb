pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

pets[:dog].push('bowser')

p pets #=> {:cat=>"fluffy", :dog=>"bowser", :fish=>"oscar"}

=begin
 used push to add a new value instead of reassigning  the
 value of :dog
 =end