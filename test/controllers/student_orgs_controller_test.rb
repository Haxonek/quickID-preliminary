require 'test_helper'

class StudentOrgsControllerTest < ActionController::TestCase
  setup do
    @student_org = student_orgs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_orgs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_org" do
    assert_difference('StudentOrg.count') do
      post :create, student_org: { description: @student_org.description, encrypted_password: @student_org.encrypted_password, reset_password_sent_at: @student_org.reset_password_sent_at, reset_password_token: @student_org.reset_password_token, sign_in_count: @student_org.sign_in_count, university_id: @student_org.university_id, username: @student_org.username }
    end

    assert_redirected_to student_org_path(assigns(:student_org))
  end

  test "should show student_org" do
    get :show, id: @student_org
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_org
    assert_response :success
  end

  test "should update student_org" do
    patch :update, id: @student_org, student_org: { description: @student_org.description, encrypted_password: @student_org.encrypted_password, reset_password_sent_at: @student_org.reset_password_sent_at, reset_password_token: @student_org.reset_password_token, sign_in_count: @student_org.sign_in_count, university_id: @student_org.university_id, username: @student_org.username }
    assert_redirected_to student_org_path(assigns(:student_org))
  end

  test "should destroy student_org" do
    assert_difference('StudentOrg.count', -1) do
      delete :destroy, id: @student_org
    end

    assert_redirected_to student_orgs_path
  end
end
