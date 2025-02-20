require 'nokogiri'
require 'pry'

def create_project_hash
  projects = {}
  
  html = File.read('fixtures/kickstarter.html')
  
 
  kickstarter = Nokogiri::HTML(html)
  
  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("h2.bbcard_name strong a").text,
      :location => project.css("ul.project-meta span.location-name").text,
      :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i
    }
  end 
  
  projects
  
  #projects: kickstarter.css("li.project.grid_4")
  #project.css("h2.bbcard_name strong a").text
  #project.css("div.project-thumbnail a img").attribute("src").value
  #project.css("p.bbcard_blurb").text
  #project.css("ul.project-meta span.location-name").text
  #project.css("ul.project-stats li.first.funded strong").text
end