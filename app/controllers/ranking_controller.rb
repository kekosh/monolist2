class RankingController < ApplicationController

  #持っているものの多い順のアイテムを上位10個表示
  def have
    items = Have.group(:item_id).order('count_item_id desc').limit(10).count('item_id')
    item_ids = items.keys
    @ranking = Item.find(item_ids).sort_by{|o| item_ids.index(o.id)}
  end

  #欲しいものの多い順のアイテムを上位10個表示
  def want
    items = Want.group(:item_id).order('count_item_id desc').limit(10).count('item_id')
    item_ids = items.keys
    @ranking = Item.find(item_ids).sort_by{|o| item_ids.index(o.id)}
  end
end
