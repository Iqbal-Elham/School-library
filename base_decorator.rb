require './nameable.rb'

class BaseDecorator < Nameable
    attr_accessor :nameable

    def initialize(nameable)
      @nameable = nameable
    end
  
   
end