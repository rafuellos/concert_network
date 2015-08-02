class Comment < ActiveRecord::Base
  belongs_to :concert
  validates :user, :comment, presence: true 


  has_attached_file :avatar, :url => "http://www.praize.com/forum/icons/users/31-user_icon-1.jpg",
                           styles: {:medium => "150x150", :thumb => "20x20"}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end