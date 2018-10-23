class Article < ApplicationRecord
	#model
	#Esta es la clase modelo de articulos
	#la tabla => articles
	#campos article.title() => 'El titulo del articulo'
	#Excribir metodos
	validates :title,presence: true,uniqueness: true
	validates :body,presence: true, length: {minimum: 20}

	#validates :username, format: {with: /regex/}
end
