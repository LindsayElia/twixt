class Reminder < ApplicationMailer

	def send_email_notification(array)
			unless array.length == 0
				array.each do |notification|
				unless notification.recemail.nil?
						if notification.message == nil
							mail(from: 'reminder@twixt.com',
							to: notification.recemail,
							subject: "A reminder from Twixt!",
							body: "Twixt App is contacting you to remind you about #{notification.item_id}",
							)
						else 
							mail(from: 'reminder@twixt.com',
							to: notification.recemail,
							subject: "A reminder from Twixt!",
							body: "#{notification.message}",
							)
						end
					end
				end
			end
	end

end