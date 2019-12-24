class ContactMailersController < ApplicationController
	def index
    @message = ContactMailer.new
  end

  def confirm
    @message = ContactMailer.new(contact_mailer_params)
    if @message.valid?
      render :action => 'confirm'
    else
      render :action => 'index'
    end
  end

  def done
    @message = ContactMailer.new(contact_mailer_params)
    if params[:back]
      render :action => 'index'
    else
      ContactMailer.received_email(@message).deliver
      render :action => 'done'
    end
  end

  private
  def contact_mailer_params
    params.require(:contact_mailer).permit(:name, :email, :content)
  end
end
