class Product < ActiveRecord::Base
    belongs_to :user
    def display_reorder 
        if self.reorder == true 
            "yes"
        else
            "no"
        end
    end
end