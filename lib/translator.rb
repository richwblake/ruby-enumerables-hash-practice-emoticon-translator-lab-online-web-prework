require 'yaml'

def load_library( file_path )
  lib = YAML.load_file( file_path )
  emoticon_data = { "get_meaning" => {}, "get_emoticon" => {} }

  lib.each_pair { |emotion, face_array|
    emoticon_data["get_meaning"][face_array.last] = emotion
    emoticon_data["get_emoticon"][face_array.first] = face_array.last
  }

  emoticon_data
end

def get_japanese_emoticon( file_path, emo )
  lib = load_library( file_path )
  lib["get_emoticon"].each_pair { |emoticon, meaning|
    if emoticon == emo
      return meaning
    end
  }
  "Sorry, that emoticon was not found"
end

def get_english_meaning( file_path, emo )
  lib = load_library( file_path )
  lib["get_meaning"].each_pair { |emoticon, meaning|
    if emoticon == emo
      return meaning
    end
  }
  "Sorry, that emoticon was not found"
end