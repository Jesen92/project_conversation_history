# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  has_many :comments, class_name: 'Projects::Comment'

  def full_name
    "#{first_name} #{last_name}"
  end
end
