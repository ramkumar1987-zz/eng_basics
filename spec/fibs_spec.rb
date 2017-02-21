require_relative '../fibs'

describe Fibs do
  let(:subject) { Fibs.new }

  describe '#generate' do
    let(:expected_result) do
      [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
    end

    it 'returns the number of requested fibonacci numbers' do
      expect(subject.generate(10)).to eq(expected_result)
    end

    it 'stores the values' do
      subject.generate(10)
      expect(subject.generated_fibs).to eq(expected_result)
    end

    context 'when it already knows the requested number of sequence numbers' do
      # setting an expectation that generated_fibs holds the original fibonacci
      # sequence despite generating a sequence for a lower value.
      it 'does not call generate_fibs' do
        subject.generate(10)
        expect(subject.generate(5)).to eq([0, 1, 1, 2, 3])
        expect(subject.generated_fibs).to eq(expected_result)
      end
    end
  end

  describe '#is_known_fib?' do
    before(:each) do
      subject.generated_fibs = [0, 1, 1, 1]
    end

    context 'when passed a fibonacci number that it has not stored' do
      it 'returns false' do
        expect(subject.is_known_fib?(400)).to eq(false)
      end
    end

    context 'when passed a number that has been stored' do
      it 'returns true' do
        expect(subject.is_known_fib?(1)).to eq(true)
      end
    end
  end

  describe '#all_fibs?' do
    before(:each) do
      subject.generated_fibs = [0, 1, 1, 2]
    end

    context 'when passed an array of numbers that are all members of ' \
            'the the fibonacci sequence' do
      it 'returns true' do
        expect(subject.all_fibs?([0, 1, 1, 2])).to eq(true)
      end
    end

    context 'when passed an array of numbers that where at least one is not ' \
            'a member of the sequence' do
      it 'returns false' do
        expect(subject.all_fibs?([0, 1, 1, 1])).to eq(false)
      end
    end
  end

  describe '#known_fibs_sum_of_squares' do
    let(:expected_result) { 15 }

    context 'when there are stored numbers' do
      before do
        subject.generated_fibs = [0, 1, 1, 2, 3]
      end

      it 'returns the sum of the squared values for all known fibs' do
        expect(subject.known_fibs_sum_of_squares).to eq(expected_result)
      end
    end

    context 'when there are no stored numbers' do
      it 'returns 0' do
        expect(subject.known_fibs_sum_of_squares).to eq(0)
      end
    end
  end
end
