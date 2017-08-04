class AnswerMailer < ApplicationMailer

	def answer_mailer email
		 mail(to: email, subject: 'Answer to your question is given.')
	end
end
