def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, cash)
  shop[:admin][:total_cash] += cash
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, sold)
  shop[:admin][:pets_sold] += sold
end

def stock_count(shop)
  return shop[:pets].length
end

def pets_by_breed(shop, breed)
  matched_pets = []
  pets = shop[:pets]
  for pet in pets
    if pet[:breed] == breed
      matched_pets.push(pet[:name])
    end
  end
  return matched_pets
end
