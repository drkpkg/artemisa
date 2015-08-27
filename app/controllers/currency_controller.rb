class CurrencyController < ApplicationController
  def list_all
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    else
      @categories = AssetCategory.all
    end
  end

  def create

  end

  def modify

  end

  def delete

  end
end
