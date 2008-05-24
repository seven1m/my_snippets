require 'rss'
require 'open-uri'

class Snippet < ActiveRecord::Base
  validates_presence_of :name, :code
  acts_as_taggable
  
  DZONE_BASE_URL = 'http://snippets.dzone.com/rss/user/'
  
  def self.import_from_dzone_snippets(username, owner_url)
    page = 1
    while (rss = RSS::Parser.parse(open(DZONE_BASE_URL + username + "?page=#{page}"), false)).items.any?
      rss.items.each do |item|
        puts item.title
        code = item.description.scan(/<code>(.+?)<\/code>/m).map { |m| m[0] }.join("\n\n").gsub(/<br\s*\/>/, '')
        description = item.description.gsub(/<code>(.+?)<\/code>/m, '').gsub(/<.+?>/, '')
        Snippet.create(:name => item.title, :description => description, :code => code, :owner_url => owner_url, :created_at => item.date.to_s)
      end
      page +=1
    end
  end
end
