class StudentOrgsController < ApplicationController
  before_action :set_student_org, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_university!
  # after_action :verify_student_org, only: [:sign_in]

  # GET /student_orgs
  # GET /student_orgs.json
  def index
    @student_orgs = StudentOrg.all.where(university_id: current_university.id)
  end

  # GET /student_orgs/1
  # GET /student_orgs/1.json
  def show
    @students = Student.all.where(student_org_id: params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @students.as_json(only: [:created_at]) }
    end
    # can be done with jbuilder but idk why I'd need that
  end

  # GET /student_orgs/new
  def new
    @student_org = current_university.student_orgs.build
  end

  # GET /student_orgs/1/edit
  def edit
  end

  def sign_in
    @student_org = StudentOrg
  end

  def verify_student_org
    unless @temp.nil? || @temp.encrypted_password.nil?
      @temp = StudentOrg.find(params[:username]).first
      if @temp.encrypted_password == params[:encrypted_password]
        redirect_to show_student_org_path(params[:id])
      else
        render 'sign_in'
      end
    end
  end

  # POST /student_orgs
  # POST /student_orgs.json
  def create
    @student_org = current_university.student_orgs.build(student_org_params)

    respond_to do |format|
      if @student_org.save
        format.html { redirect_to @student_org, notice: 'Student org was successfully created.' }
        format.json { render :show, status: :created, location: @student_org }
      else
        format.html { render :new }
        format.json { render json: @student_org.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_orgs/1
  # PATCH/PUT /student_orgs/1.json
  def update
    respond_to do |format|
      if @student_org.update(student_org_params)
        format.html { redirect_to @student_org, notice: 'Student org was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_org }
      else
        format.html { render :edit }
        format.json { render json: @student_org.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_orgs/1
  # DELETE /student_orgs/1.json
  def destroy
    @student_org.destroy
    respond_to do |format|
      format.html { redirect_to student_orgs_url, notice: 'Student org was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_org
      @student_org = StudentOrg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_org_params
      params.require(:student_org).permit(:username, :encrypted_password, :reset_password_token, :reset_password_sent_at, :sign_in_count, :university_id, :description)
    end
end
