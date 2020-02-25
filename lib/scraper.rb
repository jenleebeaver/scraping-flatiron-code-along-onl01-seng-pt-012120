require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb' #this allows scraper to make new courses and give them attributes scraped
#from the web page 

class Scraper

  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))

    binding.pry
  end

  def print_courses
    self.make_courses
    Course.all.each do |course| #iterating over all courses
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

end

Scraper.new.get_page
