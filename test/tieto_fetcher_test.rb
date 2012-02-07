require 'test_helper'

class TietoFetcherTest < Test::Unit::TestCase

  def setup
    @receiver = mock()
  end

  def test_should_set_configuration_instance_variables
    create_tieto_fetcher
    assert_equal 'test.host', @tieto_fetcher.instance_variable_get(:@server)
    assert_equal 'name', @tieto_fetcher.instance_variable_get(:@username)
    assert_equal 'password', @tieto_fetcher.instance_variable_get(:@password)
    assert_equal @receiver, @tieto_fetcher.instance_variable_get(:@receiver)
  end

  def test_should_require_subclass
    create_tieto_fetcher
    assert_raise(NotImplementedError) { @tieto_fetcher.fetch }
  end

  def test_should_require_server
    assert_raise(ArgumentError) { create_tieto_fetcher(:server => nil) }
  end

  def test_should_require_username
    assert_raise(ArgumentError) { create_tieto_fetcher(:username => nil) }
  end

  def test_should_require_password
    assert_raise(ArgumentError) { create_tieto_fetcher(:password => nil) }
  end

  def test_should_require_receiver
    assert_raise(ArgumentError) { create_tieto_fetcher(:receiver => nil) }
  end

  def create_tieto_fetcher(options={})
    @tieto_fetcher = TietoFetcher::Base.new({:server => 'test.host', :username => 'name', :password => 'password', :receiver => @receiver}.merge(options))
  end

end

class FactoryTietoFetcherTest < Test::Unit::TestCase

  def setup
    @receiver = mock()
    @pop_tieto_fetcher = TietoFetcher.create(:type => :pop, :server => 'test.host',
                               :username => 'name',
                               :password => 'password',
                               :receiver => @receiver)

  @imap_tieto_fetcher = TietoFetcher.create(:type => :imap, :server => 'test.host',
                              :username => 'name',
                              :password => 'password',
                              :receiver => @receiver)
  end

  def test_should_be_sublcass
    assert_equal TietoFetcher::Pop, @pop_tieto_fetcher.class
    assert_equal TietoFetcher::Imap, @imap_tieto_fetcher.class
  end

  def test_should_require_type
    assert_raise(ArgumentError) { TietoFetcher.create({}) }
  end

end
