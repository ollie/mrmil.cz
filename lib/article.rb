class ArticleNotFoundError < Exception; end
class BodyNotFoundError < Exception; end

class Article
  attr_accessor :name, :path, :info
  attr_reader :date

  def self.preload_articles!
    @@articles = eval_script('./articles/articles.rb').map do |article|
      self.new article
    end
  end

  def self.articles
    @@articles
  end

  def self.all(sort_options = {})
    articles = self.articles

    unless sort_options.empty?
      field = sort_options.keys.first
      order = sort_options.values.first

      articles = self.articles.sort_by do |article|
        article.send field
      end

      articles.reverse! if order == :desc
    end

    articles
  end

  def self.find_by_path(path)
    article = self.articles.find { |article| article.path == path }
    raise ArticleNotFoundError.new("Article with path #{ path } not found") unless article
    article
  end

  def initialize(attributes = {})
    attributes.each do |attribute, value|
      self.send "#{ attribute }=", value
    end
  end

  def url
    "/stranky/#{ self.path }"
  end

  def date=(value)
    @date = DateTime.parse(value)
  end

  def body
    raise BodyNotFoundError.new('@path must not be blank!') if self.path.nil? || self.path.empty?
    body_path = "./articles/#{ self.path }.md"
    raise BodyNotFoundError.new("Path does not exist: #{ body_path }") unless File.exists?(body_path)
    RDiscount.new( File.read(body_path) ).to_html
  end
end

Article.preload_articles!
