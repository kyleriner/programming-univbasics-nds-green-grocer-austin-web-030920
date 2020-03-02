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
  
  pp cart
  pp coupons
  
  discounted_items = []
  i = 0
  while i < cart.length do
    item = find_item_by_name_in_collection(coupons[counter][:item], )
      
  
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
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
end
