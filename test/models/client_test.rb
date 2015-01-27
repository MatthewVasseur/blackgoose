require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @client = Client.new({username: "example", name:"Example Client", dob:"1995-11-08",
    line1: "94 Example Street", city: "Exampleton", state: "EX", zip:"00000",
    password: "12345789", token: "111111"})

    @client2 = Client.new({username: "example2", name:"Example2 Client", dob:"1996-11-08",
    line1: "96 Example Street", city: "Exampleton2", state: "NJ", zip:"00002",
    password: "12345782", token: "200000"})
  end

  test "should be valid" do
    assert @client.valid?,  "1: #{@client.errors.messages}"
    assert @client2.valid?, "2: #{@client2.errors.messages}"
  end

  test "username should be present" do
    @client.username = "    "
    assert_not @client.valid?
  end

  test "username should be unique" do
    @client2.username = "example"
    @client.save
    assert_not @client2.valid?
  end

  test "username should be case insensitive" do
    @client2.username = "EXAMPLE"
    @client.save
    assert_not @client2.valid?
  end

  test "name should be present" do
    @client.name = "    "
    assert_not @client.valid?
  end

  test "dob should be present" do
    @client.dob = "    "
    assert_not @client.valid?
  end

  test "line1 should be present" do
    @client.line1 = "    "
    assert_not @client.valid?
  end

  test "city should be present" do
    @client.city = "    "
    assert_not @client.valid?
  end

  test "state should be present" do
    @client.state = "    "
    assert_not @client.valid?
  end

  test "state should be of valid form" do
    invalid_states = %w[abc N NJN NYC CTN ABC 12 "13" "CE3" ce3 C2 c1
      New\ Jersey Carolina]

    invalid_states.each do |invalid_state|
      @client.state = invalid_state
      assert_not @client.valid?, "#{invalid_state.inspect} should be invalid"
    end

    valid_states = %w[NY CT AB]

    valid_states.each do |valid_state|
      @client.state = valid_state
      assert @client.valid?, "#{valid_state.inspect} should be valid"
    end
  end

  test "zip should be present" do
    @client.zip = "    "
    assert_not @client.valid?
  end

  test "zip should be of valid form" do
    invalid_zips = %w[1 12 123 1234 123456 1234567 12345678910 123-1234566
      08540-098 085400-9842 08540-4312-3423]

    invalid_zips.each do |invalid_zip|
      @client.zip = invalid_zip
      assert_not @client.valid?, "#{invalid_zip.inspect} should be invalid"
    end

    valid_zips = %w[08540 12345 98321 08540-0123 06521-5432 05651]

    valid_zips.each do |valid_zip|
      @client.zip = valid_zip
      assert @client.valid?, "#{valid_zip.inspect} should be valid"
    end
  end
=begin
  Token tests are not needed

  test "token should be of valid length" do
    @client.token = "55555"
    @client2.token = "7777777"
    assert_not @client.valid?, "-- 1 --"
    assert_not @client2.valid?, "-- 2 --"
  end

  test "token should be unique" do
    @client2.token = "111111"
    @client.save
    assert_not @client2.valid?
  end

  test "token should not be 0" do
    @client.token = "0"
    assert_not @client.valid?
  end
=end
end
