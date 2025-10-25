module Types
  class SenderUnion < Types::BaseUnion
    possible_types Types::InternType, Types::CompanyType

    def self.resolve_type(object, _context)
      if object.is_a?(Intern)
        Types::InternType
      elsif object.is_a?(Company)
        Types::CompanyType
      else
        raise "Unexpected object: #{object}"
      end
    end
  end
end
