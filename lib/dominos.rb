module Dom
  # Check https://github.com/ngauthier/domino for documentation 
  class Transaction < Domino
    selector '#transactions li'
    attribute :description, 'p' 
  end
end
