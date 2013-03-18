require_relative '../spec_helper'

# class FakeRequest
#   def initialize accept_header
#     @accept_header = accept_header
#   end

#   def headers
#     { 'Accept' => @accept_header }
#   end
# end

# describe ApiConstraints do
#   describe 'the league-server type check' do
#     let(:check) { ApiConstraints.new version: 1 }

#     it 'accepts the league-server type' do
#       check.matches? FakeRequest.new('application/vnd.league-server; version=1')
#       check.send(:type_matches?).should == true
#     end

#     it 'rejects other types' do
#       check.matches? FakeRequest.new('text/html')
#       check.send(:type_matches?).should == false
#     end
#   end

#   describe 'matching specified versions' do
#     let(:check) { ApiConstraints.new version: 1 }
    
#     it 'accepts correct versions' do
#       check.matches? FakeRequest.new('application/vnd.league-server; version=1')
#       check.send(:version_matches?).should == true
#     end
    
#     it 'rejects correct versions' do
#       check.matches? FakeRequest.new('application/vnd.league-server; version=3')
#       check.send(:version_matches?).should == false
#     end
#   end
# end