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

def find_pet_by_name(shop, name)
  pets = shop[:pets]
  for pet in pets
    if pet[:name] == name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(shop, name)
  pets = shop[:pets]
  for pet in pets
    if pet[:name] == name
      pets.delete(pet)
    end
  end
end

def add_pet_to_stock(shop, new_pet)
  pets = shop[:pets]
  pets << new_pet
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
end

def customer_can_afford_pet(customer, pet)
cust_cash = customer[:cash]
pet_price = pet[:price]
if cust_cash < pet_price
  return false
end
return true
end

def sell_pet_to_customer(shop, sold_pet, customer)
pet = find_pet_by_name(shop, sold_pet)
  for pet in shop[:pets]
    price = pet[:price]
    if pet == nil
      return "Pet not found"
    elsif customer[:cash] < price
      return "Insufficient funds"
    elsif sold_pet == pet
      customer[:pets].push(pet)
      shop[:pets].delete(pet)
      shop[:admin][:pets_sold] += 1
      shop[:admin][:total_cash] += price
      customer[:cash] -= price
    end
  end
end
