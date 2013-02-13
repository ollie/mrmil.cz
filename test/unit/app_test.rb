require 'test_helper'

describe 'articles' do

  Article.articles.each do |article|
    describe article.name do
      before do
        get "/stranky/#{ article.path }"
      end

      it 'response status' do
        last_response.ok?.must_equal true
      end

      it 'response body' do
        last_response.body.must_include article.name
      end

      it 'response body' do
        last_response.body.must_include article.info
      end
    end
  end

  describe 'non existent article' do
    before do
      get '/stranky/xxx'
    end

    it 'response status code' do
      last_response.status.must_equal 404
    end

    it 'response status' do
      last_response.ok?.must_equal false
    end

    it 'response body' do
      last_response.body.must_include '404'
    end
  end

  describe 'redirects' do
    it 'redirects from /stranky to /' do
      get '/stranky'
      last_response.status.must_equal 301
      follow_redirect!
      last_request.path.must_equal '/'
    end

    it 'redirects from /stitky to /' do
      get '/stitky'
      last_response.status.must_equal 301
      follow_redirect!
      last_request.path.must_equal '/'
    end

    it 'redirects from /stitky/poezie to /' do
      get '/stitky/poezie'
      last_response.status.must_equal 301
      follow_redirect!
      last_request.path.must_equal '/'
    end
  end

  describe 'rss' do
    before do
      get '/stranky.rss'
    end

    it 'response status' do
      last_response.ok?.must_equal true
    end
  end

end

