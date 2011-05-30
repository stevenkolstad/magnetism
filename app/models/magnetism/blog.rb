module Magnetism
  class Blog
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Paranoia
    include Mongoid::Tracking  
  
    field :meta_title
    field :name
    field :categories, type: Array
  
    embeds_many :posts
  end
end
