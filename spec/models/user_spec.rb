require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    subject {
      User.new({
        last_name: 'Lin',
        first_name: 'Sean',
        email: 'sean@sean',
        password: 'sean',
        password_confirmation: 'sean'
      })
    }

    it "should have password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    # it "should have password_confirmation" do
    #   subject.password_confirmation = nil
    #   expect(subject).to_not be_valid
    #   p '---------------'
    #   p subject
    # end
    
    it 'should have email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'should have first name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it 'should have last name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it 'should have password with minimun length as 6' do
      subject.password = '11111'
      expect(subject).to_not be_valid
    end


  end

  describe '.authenticate_with_credentials' do

      it 'should pass authentication' do

        @user = User.create!({
          last_name: 'Lin',
          first_name: 'Sean',
          email: 'sean@sean',
          password: 'sean123',
          password_confirmation: 'sean123'
        })
        getuser = User.authenticate_with_credentials('sean@sean','sean123')
        expect(getuser).to_not be nil
    end
  end
end
