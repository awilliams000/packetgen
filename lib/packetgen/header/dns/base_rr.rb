module PacketGen
  module Header
    class DNS

      # Mixin module for {RR} and {Question}.
      # @author Sylvain Daubert
      module BaseRR

        # Getter for type
        # @return [Integer]
        def type
          self[:type].to_i
        end

        # Setter for type
        # @param [Integer] val
        # @return [Integer,String]
        def type=(val)
          v = case val
              when String
                self.class::TYPES[val.upcase]
              else
                val
              end
          self[:type].read v
        end

        # Getter for class
        # @return [Integer]
        def rrclass
          self[:rrclass].to_i
        end

        # Setter for class
        # @param [Integer] val
        # @return [Integer,String]
        def rrclass=(val)
              v = case val
                  when String
                    self.class::CLASSES[val.upcase]
                  else
                    val
                  end
          self[:rrclass].read v
        end
          
        # Get human readable type
        # @return [String]
          def human_type
          self.class::TYPES.key(type) || "%04x" % type
        end

        # Get human readable class
        # @return [String]
        def human_rrclass
          self.class::CLASSES.key(self.rrclass) || "%04x" % self.rrclass
        end

      end
    end
  end
end
