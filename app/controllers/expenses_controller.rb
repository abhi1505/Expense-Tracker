class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # GET /expenses
  # GET /expenses.json
  def index
  @user = User.find(params[:user_id])
    @expenses = @user.expenses.all
 
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  # POST /expenses.json
  def create
   @user = User.find(params[:user_id])
    @expense = @user.expenses.create(expense_params)
    
 

    respond_to do |format|
      if @expense.save
        format.html { redirect_to user_path(@user), notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { redirect_to user_path(@user), notice: 'Expense could not be created.'  }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
     @user = User.find(params[:user_id])
    @expense = @user.expenses.find(params[:id])
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@user), notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:title, :amount)
    end
end
