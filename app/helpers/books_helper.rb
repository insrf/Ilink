module BooksHelper
  def nested_books(books)
    books.map do |book, sub_books|
      render(book) + content_tag(:ul, nested_books(sub_books), :class => "nested_books")
    end.join.html_safe
  end
end
