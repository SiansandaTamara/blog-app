require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Testing in rails', text: 'Tests in rails are amazing') }
  before { subject.save }

  it 'title should not be blank' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  # it 'title should be maximum of 250 characters' do
  #   subject.title = 'a' * 300
  #   expect(subjects).to_not be_valid
  # end

  it 'posts counter should be an integer greater than or equal to zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'posts counter should be an integer greater than or equal to zero' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
end
