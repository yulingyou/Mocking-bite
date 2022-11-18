require 'cat_facts'

RSpec.describe CatFacts do
  it "returns cat facts" do 
    fake_requester = double :requester
    allow(fake_requester).to receive(:get).with(URI("https://catfact.ninja/fact")).and_return('{"fact":"Cats have 32 muscles that control the outer ear (compared to human\'s 6 muscles each). A cat can rotate its ears independently 180 degrees, and can turn in the direction of sound 10 times faster than those of the best watchdog.","length":226}')
    catfact = CatFacts.new(fake_requester)
    expect(catfact.provide).to eq "Cat fact:" + " Cats have 32 muscles that control the outer ear (compared to human\'s 6 muscles each). A cat can rotate its ears independently 180 degrees, and can turn in the direction of sound 10 times faster than those of the best watchdog."
  end
end