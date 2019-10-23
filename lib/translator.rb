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

def get_japanese_emoticon( emo, file_path )
  lib = load_library
  lib.each_pair { |emotion, face_array|
    face_array.each { |face_string|
      if emo == face_string
        return face_array.shift
      end
    }
  }
end

def get_english_meaning( emo, file_path )
  lib = load_library
  lib.each_pair { |emotion, face_array|
    face_array.each { |face_string|
      if emo2 == face_string
        return face_array.pop
      end
    }
  }
end