module ArticlesHelper
	def toggle_like_button(article, user)
	  if current_user
	  	if user.flagged?(article)
	  		link_to 'Unlike', like_article_path(@article)
	  	else
	  		link_to 'Like', like_article_path(@article)
	  	end
	  end
	end
end
