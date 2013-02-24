# encoding: utf-8

describe Article do
  it 'has a name' do
    article = Article.new
    article.name = 'Title'
    article.name.must_equal 'Title'
  end

  it 'has a name through attributes' do
    article = Article.new name: 'Title'
    article.name.must_equal 'Title'
  end

  it 'has info' do
    article = Article.new
    article.info = 'Info'
    article.info.must_equal 'Info'
  end

  it 'has info through attributes' do
    article = Article.new info: 'Info'
    article.info.must_equal 'Info'
  end

  it 'has an path' do
    article = Article.new
    article.path = 'title'
    article.path.must_equal 'title'
  end

  it 'has an path through attributes' do
    article = Article.new path: 'title'
    article.path.must_equal 'title'
  end

  it 'has a date' do
    article = Article.new
    article.date = '2009-03-25 21:24:16 +0100'
    article.date.year.must_equal 2009
    article.date.month.must_equal 3
    article.date.day.must_equal 25
    article.date.hour.must_equal 21
    article.date.minute.must_equal 24
    article.date.second.must_equal 16
    article.date.zone.must_equal '+01:00'
  end

  it 'has a date through attributes' do
    article = Article.new date: '2009-03-25 21:24:16 +0100'
    article.date.year.must_equal 2009
    article.date.month.must_equal 3
    article.date.day.must_equal 25
    article.date.hour.must_equal 21
    article.date.minute.must_equal 24
    article.date.second.must_equal 16
    article.date.zone.must_equal '+01:00'
  end

  it 'raises an exception with invalid date' do
    article = Article.new
    proc { article.date = '2009-0 3-25 21:24:16 +0100' }.must_raise ArgumentError
  end

  it 'raises an exception with invalid date through attributes' do
    proc { Article.new date: '2009-0 3-25 21:24:16 +0100' }.must_raise ArgumentError
  end

  it 'has body' do
    article = Article.articles.first
    article.body.must_include 'Žil byl jednou jeden tetřev'
  end

  it 'raises an exception if body was not found' do
    article = Article.new
    proc { article.body }.must_raise BodyNotFoundError
  end

  it 'raises an exception if body was not found 2' do
    article = Article.new path: 'adasda'
    proc { article.body }.must_raise BodyNotFoundError
  end

end
