# frozen_string_literal: true

class MemberCategoriesController < ApplicationController
  layout 'dashboard'

  def index
    @member_categories = MemberCategory.all
  end

  def show; end

  def new
    @member_category = MemberCategory.new
    @member_category.category_rulesets.build
  end

  def create
    @member_category = MemberCategory.new(member_category_params)

    old_default = MemberCategory.where(default_for: member_category_params[:default_for])
    old_default&.update(default_for: :none)

    if @member_category.save
      redirect_to edit_member_category_path(@member_category),
                  notice: 'Member Category successfully created'
    else
      render :new
    end
  end

  def edit
    set_member_category
  end

  def update
    set_member_category

    old_default = MemberCategory.where(default_for: member_category_params[:default_for])
    old_default&.update(default_for: :none)

    if @member_category.update(member_category_params)
      redirect_to edit_member_category_path(@member_category),
                  notice: 'Member Category successfully updated'
    else
      render :edit
    end
  end

  def destroy
    set_member_category
    @member_category.destroy
    redirect_to member_categories_url, notice: 'Member Category was successfully destroyed.'
  end

  private

  def set_member_category
    @member_category = MemberCategory.find(params[:id])
  end

  def member_category_params
    params.require(:member_category).permit(:name,
                                            :default_for, 
                                            category_rulesets_attributes: CategoryRuleset.attribute_names.map(&:to_sym).push(:_destroy))
  end
end
