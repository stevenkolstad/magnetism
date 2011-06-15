module Magnetism
  class Post
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Paranoia
    include Mongoid::Tracking
    include Mongoid::Markdown

    field :title
    field :permalink
    field :description
    field :keywords

    field :body, markdown: true
    field :category

    embeds_many :comments
    embedded_in :post

    before_save :generate_permalink, :ensure_titleization

    def to_param
      permalink
    end

  private

    def generate_permalink
      self.permalink = self.title.parameterize
    end

    def ensure_titleization
      self.title = self.title.titleize
    end
  end
end
