class ItemsController < ApplicationController
  before_action :set_item, only: %i[show update destroy]

  def index
    items = Item.filter(filtering_params)
    if params[:page] && params[:page][:number]
      current_page = params[:page][:number].to_i
    else
      current_page = 1
    end

    items = items.paginate(page: current_page, per_page: 5)
    pagination = pagination(current_page, items)

    json_response(items: items, pagination: pagination)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      json_response(@item, :created)
    else
      json_response(@item.errors, 400)
    end
  end

  def show
    json_response(@item)
  end

  def update
    @item.update(item_params)
    head :no_content
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:name, :user_id, :category_id, :brand, :size, :daily_price)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def pagination(current_page, items)
    total_pages = (items.count.to_f / 5).ceil
    next_page   = current_page < total_pages ? (current_page + 1) : nil
    prev_page   = current_page > 2 ? (current_page - 1) : nil
    {
      current_page:  current_page,
      last_page:     total_pages,
      next_page_url: "#{items_path}?page[number]=#{next_page}",
      prev_page_url: "#{items_path}?page[number]=#{prev_page}"
    }
  end

  def filtering_params
    h1 = params.permit(non_booked: [],
                       price_range_and_day: %i[min_price max_price days]).to_h
    h2 = params.permit(:item_city, :item_category, :item_name, :item_brand,
                       :size_range)
    h1.merge(h2).to_h
  end
end
