class Player
                                      
  attr_accessor :name, :life_points   #variable utiliser


  def initialize(name)                # initialisation des profils du joueur
    @name = name
    @life_points = 10
  end
  
  def show_state                      # montrer le status en cour 
    puts "> " + @name + " a " + @life_points.to_s + " points de vie"
  end
  
  def gets_damage(n)                  # fonction du degat
    @life_points -= n
    
    puts "Le joueur " + @name + " a été tué" if @life_points <= 0
  end
  
  def attacks(player)
    damage = compute_damage
    
    puts "Le joueur " + @name + " attaque le joueur " + player.name + " il lui inflige " + damage.to_s + " points de dommages"
    
    player.gets_damage(damage)
  end
  
  def compute_damage                  # le puissance de coup de facon aleatoir
    return rand(1..6)
  end
  
end

# CLASS HUMAN PLAYER
class HumanPlayer < Player             #imbriquer le class Mere 
  attr_accessor :weapon_level
  
  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end
  
  def show_state
    puts "> " + @name + " a " + @life_points.to_s + " points de vie et une arme de niveau " + @weapon_level.to_s
  end
  
  def compute_damage
    return rand(1..6) * @weapon_level         #damage aléatoir
  end
  
  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau " + new_weapon_level.to_s
   
    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Youhou! elle est meilleure que ton arme actuelle: tu la prends"
    else new_weapon_level < @weapon_level
      puts "M@#$ elle n'est pas mieux que ton arme actuelle"
    end 
  end
  
  
  def search_health_pack
    dice = rand(1..6)
                                     # fonction de recherche de santer 
    if dice == 1
      puts "Tu n'as rien trouvé..."
    elsif dice >= 2 && dice <= 5
      @life_points += 50
      
      if @life_points > 100
        @life_points =  100
      end
      
      puts "Bravo, tu as trouvé un pack de +50 points de vie!"
      
    elsif dice == 6
      @life_points += 80
      
      if @life_points > 100
        @life_points =  100
      end
      
      puts "Waouuw, tu as trouvé un pack de +80 points de vie!"
    end
    
  end
  
  
  
  
  
  
end


















