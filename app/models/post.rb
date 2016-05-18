class Post < ActiveRecord::Base
   has_many :replies
    validates :title, presence: { message: "제목을 써주세요."}
    validates :content, presence: { message: "내용을 써주세요."}
               
end
