class LRUCache
    attr_reader :cache_size, :cache

    def initialize(size)
      @cache_size = size
      @cache = []
    end

    def count
      @cache.count
      # returns number of elements currently in cache
    end

    def add(el)
      # adds element to cache according to LRU principle
      if count >= @cache_size
        @cache.shift
        @cache << el unless @cache.include?(el)
      else
        @cache << el unless @cache.include?(el)
      end

    end

    def show
      # shows the items in the cache, with the LRU item first
      @cache
    end

    private
    # helper methods go here!

  end
