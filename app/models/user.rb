class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders       
  belongs_to :province, optional: true

  def self.ransackable_attributes(auth_object = nil)
    %w[id email created_at updated_at] # Add only the fields that should be searchable
  end
end
