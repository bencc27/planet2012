require 'test_helper'

class ComentariosControllerTest < ActionController::TestCase
  setup do
    @comentario = comentarios(:one)
    @site= sites(:one)
    @updateComent = {   # @update:  parametros diferentes
      :content => 'otro texto',
      :user_id => users(:one).id,
      :site_id => sites(:one).id
    }
    @user = @comentario.user
    sign_in @user
  end


  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comentarios)
  end

  test "should create comentario" do
    assert_difference('Comentario.count') do
      post :create, comentario: @updateComent
    end

    assert_redirected_to @comentario.site
  end

  test "should show comentario" do
    get :show, id: @comentario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comentario
    assert_response :success
  end

  #test "should update comentario" do
  #  put :update, id: @comentario, comentario: @updateComent
   # assert_redirected_to @comentario.site
 # end

  test "should destroy comentario" do
    assert_difference('Comentario.count', -1) do
      delete :destroy, id: @comentario
    end

    assert_redirected_to comentarios_path
  end
end
