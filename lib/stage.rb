class Stage

  attr_reader :id
  attr_accessor :name
  
  @@stages = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  def self.all
    @@stages.values()
  end

  def save
    @@stages[self.id] = Stage.new(self.name, self.id)
  end

  def self.clear
    @@stages = {}
    @@total_rows = 0
  end

  def ==(stage_to_compare)
    self.name() == stage_to_compare.name()
  end

  def update(name)
    self.name = name
    @@stages[self.id] = Stage.new(self.name, self.id)
  end

  def delete()
    @@stages.delete(self.id)
  end

end