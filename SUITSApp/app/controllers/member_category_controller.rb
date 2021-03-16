class MemberCategoryController < ApplicationController
  layout 'dashboard'

  def index
    @member_categories = MemberCategory.all
  end

  def show
  end

  def new
    @member_category = MemberCategory.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
