class Comment < ActiveRecord::Base
  
  attr_accessible :body, :commenter

  belongs_to :post

  validates :commenter,  :presence => true
  validates :body, :presence => true,
                    :length => { :minimum => 5 }
  
end
