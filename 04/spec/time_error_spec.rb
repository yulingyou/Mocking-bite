require 'time_error'

RSpec.describe TimeError do
  it "returns the difference between the remote clock and locak clock" do
    fake_requester = double :requester
    allow(fake_requester).to receive(:get).with(URI("https://worldtimeapi.org/api/ip")).and_return('{"abbreviation":"GMT","client_ip":"2a02:c7f:9e99:9100:749a:ff88:3f8d:d93d","datetime":"2022-11-18T21:31:08.562681+00:00","day_of_week":5,"day_of_year":322,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London","unixtime":1668807068,"utc_datetime":"2022-11-18T21:31:08.562681+00:00","utc_offset":"+00:00","week_number":46}')
    time = Time.new(2022, 11, 18, 21, 31, 8)
    time_error = TimeError.new(fake_requester)
    expect(time_error.error(time)).to eq 0.562681
  end
end
