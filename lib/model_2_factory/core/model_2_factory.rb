module Model2Factory
  module Rails
    DEFAULTS = {
      integer: 1,
      bigint: 1,
      numeric: 1,
      decimal: 123.456,
      float: 123.456,
      string: "'MyString'",
      text: "'MyText'",
      datetime: "'#{Time.now.to_s}'",
      timestamp: "'#{Time.now.getutc.to_i.to_s}'",
      boolean: true
    }.freeze
  end
end
