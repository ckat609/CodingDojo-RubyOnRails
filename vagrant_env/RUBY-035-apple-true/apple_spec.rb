require_relative 'apple'

RSpec.describe AppleTree do
    context "is going to be tested" do
        before(:each) do
            @tree = AppleTree.new
        end

        it "has no getter and setter for the age attribue" do
            # @tree.age = 1
            expect(@tree.age).to eq(0)
        end

        it "has no getter method for the height" do
            expect(@tree.getHeight).to eq(1)
        end

        it "height can't be set directly" do
            expect{@tree.height=1}.to raise_error(NoMethodError)
        end

        it "has no getter method for apple count" do
            expect(@tree.getAppleCount).to eq(0)
        end

        it "apple count can't be set directly" do
            expect{@tree.apple_count=1}.to raise_error(NoMethodError)
        end

        it "has no method year_gone_by" do
            expect(@tree.year_gone_by).to eq(true)
        end

        it "can't grow apples the first three years of its life and if it's older than ten" do
            @tree.year_gone_by
            expect(@tree.age).to eq(1)
            expect(@tree.getAppleCount).to eq(0)
            @tree.year_gone_by
            expect(@tree.age).to eq(2)
            expect(@tree.getAppleCount).to eq(0)
            @tree.year_gone_by
            expect(@tree.age).to eq(3)
            expect(@tree.getAppleCount).to eq(0)
            @tree.year_gone_by
            expect(@tree.age).to eq(4)
            expect(@tree.getAppleCount).to eq(2)
            @tree.year_gone_by
            expect(@tree.age).to eq(5)
            expect(@tree.getAppleCount).to eq(4)
            @tree.year_gone_by
            expect(@tree.age).to eq(6)
            expect(@tree.getAppleCount).to eq(6)
            @tree.year_gone_by
            expect(@tree.age).to eq(7)
            expect(@tree.getAppleCount).to eq(8)
            @tree.year_gone_by
            expect(@tree.age).to eq(8)
            expect(@tree.getAppleCount).to eq(10)
            @tree.year_gone_by
            expect(@tree.age).to eq(9)
            expect(@tree.getAppleCount).to eq(12)
            @tree.year_gone_by
            expect(@tree.age).to eq(10)
            expect(@tree.getAppleCount).to eq(14)
            @tree.year_gone_by
            expect(@tree.age).to eq(11)
            expect(@tree.getAppleCount).to eq(14)
        end

        it "doesn't have a method called pick_apples to set apple_count to zero" do
            expect(@tree.pick_apples).to eq(true)
            expect(@tree.getAppleCount).to eq(0)
        end
    end
end