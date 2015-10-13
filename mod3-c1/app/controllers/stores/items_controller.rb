class Stores::ItemsController < Stores::StoresController
  def index
    @items = current_store.items
  end

  # private current_store method is in the Stores::StoreController
end
