class ContactsController < ApplicationController

  def new
    # @user = current_user
    @contact = Contact.new
    # @contact.user = current_user
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
    if @contact.save!
      redirect_to profile_path
    else
      :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :tel, :user_id)
  end

end
