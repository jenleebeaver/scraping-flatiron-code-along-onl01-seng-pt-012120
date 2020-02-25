require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb' #this allows scraper to make new courses and give them attributes scraped
#from the web page

class Scraper

  def get_page

    #doc =
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))

    #doc.css(".post").each do |post|
      #course = Course.new #new instance of course
      #course.title = post.css("h2").text #giving new course title
      #course.schedule = post.css(".date").text #schedule
      #course.description = post.css("p").text #description
      #binding.pry
    #end
  end

  def get_courses #this operates on the HTML page (the return of the #get_page)
    #and returns the collection of Nokogiri XML elements s
    self.get_page.css(".post")
  end

  def make_courses #operating on collection returned by get_courses
      self.get_courses.each do |post| #iterates  over courses
        course = Course.new #makes new course class
        course.title = post.css("h2").text #creates attributes
        course.schedule = post.css(".date").text
        course.description = post.css("p").text
      end
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

#Scraper.new.get_page
Scraper.new.print_courses
