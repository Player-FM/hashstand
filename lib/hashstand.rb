require "hashstand/version"
require 'hashie'
require 'base62'

# base62 credits: p11y (http://stackoverflow.com/users/192702/p11y)
# via http://stackoverflow.com/a/23915108/18706

module Hashstand

  def self.hash(object, options={})
    options = Hashie::Mash.new(salt: '', base: 62).merge(options)
    digest = Digest::SHA256.digest(object.to_s+options.salt)
    raise 'I only know base62 right now' unless options.base==62
    Base62.encode(pack_int(digest))
  end

  private

  def self.pack_int(str)
    str.unpack('C*').each_with_index.reduce(0){|r,(x,i)| r + (x << 8*i) }
  end

  def self.unpack_int(int)
    n = (Math.log2(int)/8).ceil
    n.times.map{|i| (int >> 8*i) & 255 }.pack('C*')
  end

end
