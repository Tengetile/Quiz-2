class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ideas, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :ideas 


  def name_display
    if first_name || last_name
      first_name.capitalize!
      last_name.capitalize!
      "#{first_name} #{last_name}".squeeze(" ").strip
    else
      email
    end
    
  end

end
