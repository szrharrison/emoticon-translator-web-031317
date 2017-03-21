# require modules here
require 'pry'
require 'yaml'
def load_library(filepath)
  # code goes here
  emoticons = YAML::load_file(filepath)
  get_meaning = emoticons.each_with_object({}) do |(meaning,emoticons), hash|
    hash[emoticons[1]] = meaning
  end
  get_emoticon = emoticons.each_with_object({}) do |(meaning,emoticons), hash|
    hash[emoticons[0]] = emoticons[1]
  end
  {
    'get_meaning' => get_meaning,
    'get_emoticon' => get_emoticon
  }
end

def get_japanese_emoticon( filepath, western )
  # code goes here
  dictionary = load_library( filepath )['get_emoticon']
  dictionary[western] || 'Sorry, that emoticon was not found'
end

def get_english_meaning( filepath, japanese_emoticon )
  # code goes here
  dictionary = load_library( filepath )['get_meaning']
  dictionary[japanese_emoticon] || 'Sorry, that emoticon was not found'
end
