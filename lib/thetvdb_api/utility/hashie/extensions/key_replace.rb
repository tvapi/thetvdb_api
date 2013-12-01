module Hashie
  module Extensions
    module KeyReplace
      def self.included(base)
        base.send :extend, ClassMethods
      end

      def initialize(source_hash = nil, default = nil, &blk)
        source_hash = replace_keys(source_hash)
        super
      end

      def replace_keys(source_hash)
        source_hash.keys.each do |key|
          new_key = self.class.key_replace(key) || key.to_s.underscore

          if new_key != key
            source_hash[new_key] = source_hash[key]
            source_hash.delete(key)
          end
        end
        source_hash
      end

      module ClassMethods
        def replace_key(*attrs)
          @key_replaces ||= {}
          into = attrs.pop
          attrs.each { |key| @key_replaces[key] = into }
        end

        def key_replaces
          @key_replaces || {}
        end

        def key_replace(key)
          key_replaces[key.to_sym]
        end
      end
    end
  end
end
