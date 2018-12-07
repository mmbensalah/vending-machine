class Machine
  attr_reader :cost,
              :capacity,
              :contents
  def initialize(data)
    @cost     = data["cost"]
    @capacity = data["capacity"]
    @contents = data["contents"]
  end
end
