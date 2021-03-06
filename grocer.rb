def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  
  i = 0
  while i < collection.length do
    if collection[i][:item] == name
      return collection[i]
    else
      i += 1
    end
  end
  return nil
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  
  consolidated_items = []
  i = 0
  while i < cart.length do
    new_item = find_item_by_name_in_collection(cart[i][:item], consolidated_items)
    if new_item != nil
      new_item[:count] += 1
    else
      new_item = {
        :item => cart[i][:item],
        :price => cart[i][:price],
        :clearance => cart[i][:clearance],
        :count => 1
      }
      consolidated_items << new_item
    end
    i += 1
  end
  return consolidated_items
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  discounted_items = []
  i = 0
  while i < coupons.length do
    item = find_item_by_name_in_collection(coupons[i][:item], cart)
    couponed_item_name = "#{coupons[i][:item]} W/COUPON"
    item_with_coupon = find_item_by_name_in_collection(couponed_item_name, cart)
    
    if item && item[:count] >= coupons[i][:num]
      if item_with_coupon
        item_with_coupon[:count] += coupons[i][:num]
        item[:count] -= coupons[i][:num]
      else
        item_with_coupon = {
          :item => couponed_item_name,
          :price => coupons[i][:cost] / coupons[i][:num],
          :count => coupons[i][:num],
          :clearance => item[:clearance]
        }
        cart << item_with_coupon
        item[:count] -= coupons[i][:num]
      end
    end
    i += 1
  end
  return cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  i = 0
  while i < cart.length
    if cart[i][:clearance]
      cart[i][:price] = (cart[i][:price] - (cart[i][:price] * 0.20)).round(2)
    end
    i +=1
  end
  return cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  
  consolidated_cart = consolidate_cart(cart)
  couponed_cart = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(couponed_cart)

  total_cost = 0
  i = 0
  while i < final_cart.length
    total_cost += final_cart[i][:price] * final_cart[i][:count]
    i += 1
  end
  if total_cost > 100
    total_cost = total_cost * 0.90
  end
  return total_cost
end
