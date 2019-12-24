class Admin::ContactsController < ApplicationController
	def update
	   contact = Contact.find(params[:id]) #contact_mailer.rbの引数を指定
	   contact.update(contact_params)
	   customer = contact.customer
	   ContactMailer.send_when_admin_reply(customer, contact).deliver
  	end
end
