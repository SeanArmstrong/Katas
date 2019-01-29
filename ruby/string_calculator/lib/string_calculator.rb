class StringCalculator
  DEFAULT_DELIMETER = /,|\n/
  REGEX = /\/\/(.+)\n(.+)/
  DELIMETER_GROUP = 1
  BODY_GROUP = 2

  def self.add(string_numbers)
    numbers = string_numbers_to_array(string_numbers)

    return 0 if numbers.length == 0

    numbers.sum
  end

  def self.string_numbers_to_array(string_numbers)
    delimeter = extract_delimeter(string_numbers)
    string_body = extract_string_of_numbers(string_numbers)

    string_body.split(delimeter).map(&:to_i)
  end

  def self.extract_delimeter(string_numbers)
    parse_string(string_numbers) do |regex_groups|
      regex_groups ? regex_groups[DELIMETER_GROUP] : DEFAULT_DELIMETER
    end
  end

  def self.extract_string_of_numbers(string_numbers)
    parse_string(string_numbers) do |regex_groups|
      regex_groups ? regex_groups[BODY_GROUP] : string_numbers
    end
  end

  def self.parse_string(string_numbers)
    yield(REGEX.match(string_numbers))
  end
end
