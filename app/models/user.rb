class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, uniqueness: true         
  has_many :questions           
  has_many :topics
  has_many :answers
  has_many :user_followings


  def self.questions
  	Question.all
  end

  def self.answers
  	Answer.all
  end

  def self.topics
  	Topic.all
  end    

  def self.following
  	UserFollowing.all
  end

end
