describe Article do
  it 'has articles' do
    Article.articles.must_be_instance_of Array
    Article.articles.size.must_equal 33
  end

  it 'has all' do
    Article.all.must_be_instance_of Array
    Article.all.size.must_equal 33
  end

  it 'find by path' do
    article = Article.find_by_path('tetrev')
    article.must_be_instance_of Article
    article.name.must_equal 'Tetřev'
  end

  it 'raises an exception if is not found by path' do
    proc { Article.find_by_path('asdadklj') }.must_raise ArticleNotFoundError
  end
end
