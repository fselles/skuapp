require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post :create, article: { aantal_drukvel: @article.aantal_drukvel, duplex: @article.duplex, inslag_liggend: @article.inslag_liggend, inslag_staand: @article.inslag_staand, kleur: @article.kleur, media: @article.media, name: @article.name }
    end

    assert_redirected_to article_path(assigns(:article))
  end

  test "should show article" do
    get :show, id: @article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @article
    assert_response :success
  end

  test "should update article" do
    patch :update, id: @article, article: { aantal_drukvel: @article.aantal_drukvel, duplex: @article.duplex, inslag_liggend: @article.inslag_liggend, inslag_staand: @article.inslag_staand, kleur: @article.kleur, media: @article.media, name: @article.name }
    assert_redirected_to article_path(assigns(:article))
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete :destroy, id: @article
    end

    assert_redirected_to articles_path
  end
end
