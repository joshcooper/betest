
class A
  def thing
    true
  end
end

class B < A
  # This method breaks kwargs handling in rspec-expectations 3.9.3
  def to_hash
    {:name => 'something'}
  end
end

class BeTest
  def accept?(obj)
    obj.thing
  end
end

RSpec.describe Betest do
  it "passes" do
    expect(BeTest.new).to be_accept(A.new)
  end

  it "fails" do
    expect(BeTest.new).to be_accept(B.new)
  end
end
