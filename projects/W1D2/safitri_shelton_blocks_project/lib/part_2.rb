def all_words_capitalized?(words)
    words.all? { |word| word == word.capitalize }
end

def no_valid_url?(urls)
    url_end = ['.com', '.net', '.io', '.org']
    after_dots = urls.map { |url| url[url.index('.')..-1] }
  	after_dots.none? { |after_dot| url_end.include?(after_dot) }
end

def any_passing_students?(students)
    students.any? { |student| student[:grades].sum / student[:grades].length > 75}
end