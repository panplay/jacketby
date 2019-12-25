class ContactsController < ApplicationController
	def index
		@contacts = Contact.page(params[:page]).order(created_at: :desc).per(16)
		@customers = Customer.all
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		@contact.customer_id = current_customer.id
		if @contact.save
			redirect_to root_path
		else
			@contacts = Contact.all
			@customers = Customer.all
			render :new
		end
	    flash[:success] = 'お問い合わせを送信しました。'
	end

	def edit
		@contact = Contact.find(params[:id])
	end

	def update
		contact = Contact.find(params[:id]) #contact_mailer.rbの引数を指定
	   	contact.update(contact_params)
	   	customer = contact.customer
	   	ContactMailer.send_when_admin_reply(customer, contact).deliver
	   	redirect_to root_path
	end

	def destroy
		contact = Contact.find(params[:id])
		contact.destroy
		@contacts = Contact.page(params[:page]).order(created_at: :desc).per(16)
		@customers = Customer.all
		render :index
	end

	private
	def contact_params
		params.require(:contact).permit(:title, :body, :reply)
	end
end
