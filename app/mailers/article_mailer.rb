class ArticleMailer < ApplicationMailer
	def new_article(article)
		@article = article

		User.all.each do |user|
			mail(to: user.email, subject: "Prueba de correo")
		end
	end
end
