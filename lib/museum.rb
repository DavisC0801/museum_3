class Museum

  attr_reader :name, :exhibits, :patrons, :revenue, :patrons_of_exhibits

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @revenue = 0
    @patrons_of_exhibits = {}
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
    @patrons_of_exhibits[exhibit] = [] if !@patrons_of_exhibits.key?(exhibit)
  end

  def recommend_exhibits(patron)
    exhibits.select{|exhibit| patron.interests.include?(exhibit.name)}
  end

  def admit(patron)
    @patrons << patron
    exhibit_order = recommend_exhibits(patron).sort_by{|exhibit| -exhibit.cost}
    exhibit_order.each do |exhibit|
      if patron.spending_money >= exhibit.cost
        patron.spend(exhibit.cost)
        @revenue += exhibit.cost
        @patrons_of_exhibits[exhibit] << patron
      end
    end
    # require 'pry'; binding.pry
  end

  def patrons_by_exhibit_interest
    patrons_by_exhibit = {}
    @exhibits.each do |exhibit|
      patrons_by_exhibit[exhibit] = @patrons.select{|p| p.interests.include?(exhibit.name)}
    end
    patrons_by_exhibit
  end



end
