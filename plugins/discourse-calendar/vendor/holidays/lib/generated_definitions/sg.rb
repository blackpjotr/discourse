# encoding: utf-8
module Holidays
  # This file is generated by the Ruby Holidays gem.
  #
  # Definitions loaded: definitions/sg.yaml
  #
  # All the definitions are available at https://github.com/holidays/holidays
  module SG # :nodoc:
    def self.defined_regions
      [:sg]
    end

    def self.holidays_by_month
      {
                1 => [{:mday => 1, :observed => "to_weekday_if_weekend(date)", :observed_arguments => [:date], :name => "New Year's Day", :regions => [:sg]},
            {:mday => 29, :year_ranges => { :limited => [2025] },:observed => "to_weekday_if_weekend(date)", :observed_arguments => [:date], :name => "First day of Chinese New Year", :regions => [:sg]},
            {:mday => 30, :year_ranges => { :limited => [2025] },:observed => "to_weekday_if_weekend(date)", :observed_arguments => [:date], :name => "Second day of Chinese New Year", :regions => [:sg]}],
      3 => [{:mday => 31, :year_ranges => { :limited => [2025] },:name => "Hari Raya Puasa", :regions => [:sg]}],
      4 => [{:mday => 18, :year_ranges => { :limited => [2025] },:name => "Good Friday", :regions => [:sg]}],
      5 => [{:mday => 1, :observed => "to_weekday_if_weekend(date)", :observed_arguments => [:date], :name => "Labour Day", :regions => [:sg]},
            {:mday => 3, :year_ranges => { :limited => [2025] },:observed => "to_weekday_if_weekend(date)", :observed_arguments => [:date], :name => "Polling Day", :regions => [:sg]},
            {:mday => 12, :year_ranges => { :limited => [2025] },:name => "Vesak Day", :regions => [:sg]}],
      6 => [{:mday => 7, :year_ranges => { :limited => [2025] },:name => "Hari Raya Haji", :regions => [:sg]}],
      8 => [{:mday => 9, :observed => "to_weekday_if_weekend(date)", :observed_arguments => [:date], :name => "National Day", :regions => [:sg]}],
      10 => [{:mday => 20, :year_ranges => { :limited => [2025] },:name => "Deepavali (Observed)", :regions => [:sg]}],
      12 => [{:mday => 25, :observed => "to_weekday_if_weekend(date)", :observed_arguments => [:date], :name => "Christmas Day", :regions => [:sg]}]
      }
    end

    def self.custom_methods
      {
          
      }
    end
  end
end
