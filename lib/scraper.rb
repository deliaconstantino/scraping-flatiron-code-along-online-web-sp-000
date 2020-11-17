require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    # binding.pry
    doc.css(".post") #collection of course offerings--returns like an array
    doc.css(".post").first.css("h2").text #title of ind course offering--first bc using first to get first element of our nokogiri "array"
    doc.css(".post").first.css(".date").text #schedule of ind course offering (first course)
    doc.css(".post").first.css("p").text #description of first course

    doc.css(".post").each do |post|
      course = Course.new
      course.title = 
    end

  end

  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

end

Scraper.new.get_page
