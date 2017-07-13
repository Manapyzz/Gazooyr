class Posts < ActiveRecord::Base

  validates :title, presence: true,
            length: { minimum: 5 }
  validates :content, presence: true,
            length: { minimum: 5 }

 # has_many :comment


end