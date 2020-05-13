require'rspec'
require'stage'

describe Stage do

  before(:each) do
    Stage.clear()
  end

  describe('#save') do
    it("saves a stage") do
      stage = Stage.new("Gold", nil)
      stage.save()
      expect(Stage.all).to(eq([stage]))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no stages") do
      expect(Stage.all).to(eq([]))
    end
  end

  describe('.clear') do
    it("clears all stages") do
      stage = Stage.new("Gold", nil)
      stage.save()
      Stage.clear()
      expect(Stage.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same stage if it has the same attributes as another stage") do
      stage = Stage.new("Gold", nil)
      stage2 = Stage.new("Gold", nil)
      expect(stage).to(eq(stage2))
    end
  end

  describe('#update') do
    it ("updates an stage by id") do
      stage = Stage.new("Gold", nil)
      stage.save()
      stage.update("Da Golden Gurlz")
      expect(stage.name).to(eq("Da Golden Gurlz"))
  end
end

end