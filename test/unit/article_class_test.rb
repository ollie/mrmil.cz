describe Article do
  it 'has articles' do
    Article.articles.must_be_instance_of Array
    Article.articles.size.must_be :>, 30
  end

  it 'has all' do
    Article.all.must_be_instance_of Array
    Article.all.size.must_be :>, 30
  end

  it 'find by path' do
    article = Article.find_by_path('tetrev')
    article.must_be_instance_of Article
    article.name.must_equal 'Tetřev'
  end

  it 'raises an exception if is not found by path' do
    proc { Article.find_by_path('asdadklj') }.must_raise ArticleNotFoundError
  end

  describe 'orders' do

    describe 'by date' do
      it 'asc' do
        articles = Article.all(date: :asc)
        articles[0].date.must_be :<, articles[1].date
        articles[1].date.must_be :<, articles[2].date
        articles[2].date.must_be :<, articles[3].date
      end

      it 'desc' do
        articles = Article.all(date: :desc)
        articles[0].date.must_be :>, articles[1].date
        articles[1].date.must_be :>, articles[2].date
        articles[2].date.must_be :>, articles[3].date
      end
    end

    describe 'by name' do
      it 'asc' do
        articles = Article.all(name: :asc)
        articles[0].name.must_be :<, articles[1].name
        articles[1].name.must_be :<, articles[2].name
        articles[2].name.must_be :<, articles[3].name
      end

      it 'desc' do
        articles = Article.all(name: :desc)
        articles[0].name.must_be :>, articles[1].name
        articles[1].name.must_be :>, articles[2].name
        articles[2].name.must_be :>, articles[3].name
      end
    end

  end
end
