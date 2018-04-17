require "yaml"

def load_library(address)
  emoticons = YAML.load_file(address)
  new_hash = {"get_emoticon"=>{}, "get_meaning"=>{}}
  emoticons.each do |k,v|
    new_hash["get_emoticon"][v[0]]=v[1]
    new_hash["get_meaning"][v[1]]=k
  end
  new_hash
end

def get_japanese_emoticon(address, emoticon)
  new_hash = load_library(address)
  if new_hash["get_emoticon"].include?(emoticon)
    return new_hash["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(address, emoticon)
  new_hash = load_library(address)
  if new_hash["get_meaning"].include?(emoticon)
    return new_hash["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
