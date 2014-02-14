require 'spec_helper'

describe Submission do
  
  before { @submission = Submission.new(title: "An Innovative Way of looking at Debt",
                                        description: "it ain't b/c i'm ugly, because i couldn't rise, couldn't start a company, make money, couldn't make it. but because i want to dismantle it.") }

  subject { @submission }

  it { should respond_to :approved }
  it { should respond_to :description }
  it { should respond_to :agreed }
  it { should respond_to :title }
  it { should respond_to :url }

  it { should be_valid }

  describe "title is blank" do
    before { @submission.title = " " }
    it { should_not be_valid }
  end

  describe "title is too long" do
    before { @submission.title = "a" * 141 }
    it { should_not be_valid }
  end

  describe "title is too short" do
    before { @submission.title = "a" * 2 }
    it { should_not be_valid }
  end

  describe "description is blank" do
    before { @submission.description = " " }
    it { should_not be_valid }
  end

  describe "description is too long" do
    before { @submission.description = "a" * 1501 }
    it { should_not be_valid }
  end

  describe "description is too short" do
    before { @submission.description = "a" * 59 }
    it { should_not be_valid }
  end

  describe "description is just at minimum" do
    before { @submission.description = "a" * 60 }
    it { should be_valid }
  end

  describe "url is too long" do
    before { @submission.url = "a" * 256 }
    it { should_not be_valid }
  end

  describe "url is too short" do
    before { @submission.url = "a" * 6 }
    it { should_not be_valid }
  end

end