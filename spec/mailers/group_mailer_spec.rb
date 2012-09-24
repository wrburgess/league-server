require "spec_helper"

describe GroupMailer do

  describe 'weekly_review' do
    let(:user) { FactoryGirl.create(:user, email: "test@example.com", password: "secret") }
    let(:mail) { GroupMailer.weekly_review(user) }
 
    #ensure that the subject is correct
    it 'renders the subject' do
      mail.subject.should == 'Group Weekly Review'
    end
 
    #ensure that the receiver is correct
    it 'renders the receiver email' do
      mail.to.should == [user.email]
    end
 
    #ensure that the sender is correct
    it 'renders the sender email' do
      mail.from.should == ["wrburgess@gmail.com"]
    end
 
    #ensure that the @name variable appears in the email body
    xit 'assigns @name' do
      mail.body.encoded.should match(user.name)
    end
 
    #ensure that the @confirmation_url variable appears in the email body
    xit 'assigns @confirmation_url' do
      mail.body.encoded.should match("http://application_url/#{user.id}/confirmation")
    end
    
  end
end
