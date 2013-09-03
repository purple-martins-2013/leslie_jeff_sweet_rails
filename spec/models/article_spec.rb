require 'spec_helper'

describe Article do
  let(:article) { Article.new(title: "Cool Article") }
  it { should belong_to(:category) }
  it { should have_and_belong_to_many(:tags) }

  context "it sets a url before creating an object" do

    it "does not have a url before creation" do
      expect(article.url).to be_nil
    end

    it "has a url after creation" do
      article.save
      time = Time.now
      expect(article.url).to eq "articles/#{time.month}/#{time.day}/#{time.year}/cool-article"
    end

  end

end
