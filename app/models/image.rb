class Image < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "800x", :thumb => "200x" }, :url => "/images/:hash.:extension", :hash_secret => "0xDECAFBAD"

  after_create :generate_token

  default_scope { order('id DESC') }

  def to_param
    token
  end
  
  def to_s
    "Image ##{id}"
  end

  private

  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
    self.save!
  end

end
