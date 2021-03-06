# A wrapper for the GET /rules API
#
# Note: No error handling is included in this wrapper
#
module ThisData
  class Rule

    # Fetch an array of Rules from the ThisData API
    # Available options can be found at
    #   http://help.thisdata.com/docs/v1rules
    #
    # Returns: Array of OpenStruct Rule objects
    def self.find(id, options={})
      response = ThisData::Client.new.get("#{ThisData::RULES_ENDPOINT}/#{id}", query: options)
      OpenStruct.new( response.parsed_response)
    end

    # Fetch an array of Rules from the ThisData API
    # Available options can be found at
    #   http://help.thisdata.com/docs/v1rules
    #
    # Returns: Array of OpenStruct Rule objects
    def self.all(options={})
      response = ThisData::Client.new.get(ThisData::RULES_ENDPOINT, query: options)
      response.parsed_response.collect do |rule_hash|
        OpenStruct.new(rule_hash)
      end
    end

    # Create a new rule on the ThisData API
    # Available options can be found at
    #   http://help.thisdata.com/docs/v1rules-1
    #
    # Returns: OpenStruct Rule object
    def self.create(rule, options={})
      response = ThisData::Client.new.post(ThisData::RULES_ENDPOINT, body: JSON.generate(rule), query: options)
      OpenStruct.new(response.parsed_response)
    end

    # Update a rule on the ThisData API
    # Available options can be found at
    #   http://help.thisdata.com/docs/v1rulesid-1
    #
    # Returns: OpenStruct Rule object
    def self.update(rule, options={})
      rule_id = OpenStruct.new(rule).id
      response = ThisData::Client.new.post("#{ThisData::RULES_ENDPOINT}/#{rule_id}", body: JSON.generate(rule), query: options)
      OpenStruct.new(response.parsed_response)
    end

    # Delete a rule on the ThisData API
    # Available options can be found at
    #   http://help.thisdata.com/docs/v1rulesid-2
    #
    # Returns: OpenStruct Rule object
    def self.destroy(id, options={})
      response = ThisData::Client.new.delete("#{ThisData::RULES_ENDPOINT}/#{id}", query: options)
      response.code.eql?(204)
    end

  end
end