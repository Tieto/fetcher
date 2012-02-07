module TietoFetcher
  # Use factory-style initialization or insantiate directly from a subclass
  #
  # Options:
  # * <tt>:type</tt> - Name of class as a symbol to instantiate
  #
  # Other options are the same as TietoFetcher::Base.new
  #
  # Example:
  #
  # TietoFetcher.create(:type => :pop) is equivalent to
  # TietoFetcher::Pop.new()
  def self.create(options={})
    klass = options.delete(:type)
    raise ArgumentError, 'Must supply a type' unless klass
    module_eval "#{klass.to_s.capitalize}.new(options)"
  end
end

require 'tieto_fetcher/base'
require 'tieto_fetcher/pop'
require 'tieto_fetcher/imap'