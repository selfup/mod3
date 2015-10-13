class Stores::OrdersController < Stores::StoresController
  def index
    @orders = current_store.orders
  end
end
