(1..10).each do |n|
  Note.create(content: "Lorem ipsum #{n}")
end
