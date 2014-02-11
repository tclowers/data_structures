require 'spec_helper'
require './linked_list'

describe LinkedList do
	let(:empty) { LinkedList.new }
	let(:one) do
		o = LinkedList.new
		o.add('a')
		o
	end
	let(:multi) do
		m = LinkedList.new
		m.add('a')
		m.add('b')
		m.add('c')
		m
	end

	it 'should return the size of the list' do
		empty.size.should == 0
		one.size.should == 1
		multi.size.should == 3
	end

	it 'should tell if list contains an element' do
		empty.contains?('a').should be_false
		one.contains?('a').should be_true
		one.contains?('b').should be_false
	end

	it 'should return all values as an array' do
		one.to_a.should == ['a']
		multi.to_a.should == ['a', 'b', 'c']
	end

	it 'should remove values from array' do
		multi2 = multi
		multi2.remove('b')
		multi2.to_a.should == ['a', 'c']
	end
end