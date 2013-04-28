class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  attr_accessor :login
  attr_accessible :login, :username, :email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache, :remove_avatar

  validates_presence_of :avatar
  validates_integrity_of :avatar
  validates_processing_of :avatar

  has_many :docs

  has_many :events, :through => :tasks
  has_many :tasks, :dependent => :destroy

  has_many :projects, :through => :duties
  has_many :duties, :dependent => :destroy


  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  # skip needing current_user password
  def update_with_password(params={})
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    update_attributes(params)
  end

end
