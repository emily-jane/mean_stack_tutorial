require 'order'

describe Order do

	it 'should take orders with 2 arguments' do
		expect(subject).to respond_to(:new_order).with(2).argument
	end

	it 'should take order and add it to order' do
		subject.new_order([[2,2],[1,1]],20)
		expect(subject.order).to eq({:fish_and_chips=>7, :burger=>6})
	end

	it 'should raise error if incorrect total price' do
		expect{subject.new_order([[2,2],[1,1]],8)}.to raise_error "Total cost is incorrect"
	end

	it 'should raise error if placing empty order' do
		expect{subject.place_order}.to raise_error "No order has been entered"
	end

	it 'can send texts' do
		expect(subject).to respond_to(:send_text)
	end

	it 'should store a menu' do
		expect(subject.menu_list).not_to be_empty
	end

	it 'should print out menu' do
		expect(subject.show).to eq "MENU
			1: burger - £6
			2: fish_and_chips - £7
			3: pie_and_mash - £9
			4: pizza - £8
			5: beer - £4
			6: wine - £5
			7: juice - £2"
	end
end
	