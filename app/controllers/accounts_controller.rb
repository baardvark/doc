class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update]

  def index
    @accounts = current_login.accounts
  end

  def show
  end

  def new
    @account = Account.new
  end

  def create
    @account = current_login.accounts.new(account_params)
    if @account.save
      redirect_to accounts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @account.update(account_params)
      redirect_to accounts_path
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to accounts_path
  end

  private
    def account_params
      params.require(:account).permit(:name)
    end

    # don't just find by the Account model or you may potentially be able to view other logins accounts
    def set_account
      @account = current_login.accounts.find(params[:id])
    end

end
