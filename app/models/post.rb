class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title, :tags_attributes, :photo
 
  validates :name,  :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
 
  has_many :comments, :dependent => :destroy
  has_many :tags
  has_attached_file :photo, :styles => {:large => "600x600>", :medium => "300x300>", :thumb => "100x100#" }, 
							:default_url => "/images/:style/missing.png",
							:url  => "/assets/images/:id/:style/:basename.:extension",
      						:path => ":rails_root/public/assets/images/:id/:style/:basename.:extension"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :photo, :less_than => 5.megabytes

  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end