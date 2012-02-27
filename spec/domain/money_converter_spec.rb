require_relative '../../app/domain/money_converter'

describe MoneyConverter do

  describe "from cents to units" do
    it { subject.from_cents_to_units(1000).should == 10 }
    it { subject.from_cents_to_units(0).should    == 0  }
    it { subject.from_cents_to_units(nil).should  == 0  }
  end 

  describe "from units to cents" do
    it { subject.from_units_to_cents(10.95).should == 1095 } 
    it { subject.from_units_to_cents(0).should   be_zero   } 
    it { subject.from_units_to_cents(nil).should be_zero   } 
  end 
end 
