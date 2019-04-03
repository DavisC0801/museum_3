class Museum

  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    exhibits.select{|exhibit| patron.interests.include?(exhibit.name)}
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    patrons_by_exhibit = {}
    @exhibits.each do |exhibit|
      patrons_by_exhibit[exhibit] = @patrons.select{|p| p.interests.include?(exhibit.name)}
    end
    patrons_by_exhibit
  end

end
