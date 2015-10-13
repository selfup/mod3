class Stores::ItemsController < ApplicationController
  def index
    @items = current_store.items
  end

  private

  def current_store
    @current_store ||= Store.find_by(slug: params[:store])
  end
end
