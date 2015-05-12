class User < ActiveRecord::Base
	  attr_accessor :password ,:interest
  has_and_belongs_to_many :interest
  has_and_belongs_to_many :group
  has_and_belongs_to_many :events
  has_many :sent_usermessages, :class_name => "Usermessage", :foreign_key => "sender_id"
  has_many :received_usermessages, :class_name => "Usermessage", :foreign_key => "receiver_id"
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true
  validates :age, :presence => true , numericality: true
  validates :longitude, :presence => true 
  validates :latitude, :presence => true 

  validates :bio, :presence => true
  before_save :encrypt_password
  after_save :clear_password

		def encrypt_password
		  if password.present?
	      self.password_salt = BCrypt::Engine.generate_salt
	      self.hashedpassword = BCrypt::Engine.hash_secret(password, password_salt)
	    
	  	end
		end
		##############################################################################
		def clear_password
		  self.hashedpassword = nil
		end
	################################################################################
	def self.authenticate(email, password)

  		user = find_by_email(email)

  		if (user)    
  			# logger.debug"mydata :#{password}"

  			if (user.hashedpassword == BCrypt::Engine.hash_secret(password, user.password_salt))
    			user
    		end
  		else
    		nil
  		end
	end
	#############################################################################################
 
	
end
