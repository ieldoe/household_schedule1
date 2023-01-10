Ransack.configure do |config|
  config.add_predicate :during_year,
                       arel_predicate: "lteq" ,
                       formatter: proc { |v|
                         Time.parse("v.yearv.month-1").all_month
                         # または `..` で 4/1〜3/31 でもOK
                         # Time.zone.parse("#{v.year}-4-1").to_date..Time.zone.parse("#{v.year + 1}-3-31").to_date
                       },
                       type: :date
end
