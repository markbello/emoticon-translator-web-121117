require 'yaml'
require 'pry'

def load_library(path)
  library = {
      "get_emoticon" => {},
      "get_meaning" => {}
  }
  file = YAML.load_file(path)
  file.each do |key, value|

    japanese_emoji_hash = {}
    japanese_emoji_hash[value[1]] = key
    english_emoji_hash = {}
    english_emoji_hash[value[0]] = value[1]
    library["get_emoticon"].update(english_emoji_hash)
    library["get_meaning"].update(japanese_emoji_hash)
  end
  library
end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  library["get_emoticon"][emoticon] ? library["get_emoticon"][emoticon] : "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  library = load_library(path)
  library["get_meaning"][emoticon] ? library["get_meaning"][emoticon] : "Sorry, that emoticon was not found"
end
