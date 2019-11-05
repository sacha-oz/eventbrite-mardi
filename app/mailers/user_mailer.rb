class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://eventbis.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def participate_email(attendance)
  	@user = User.find(attendance.user_id)
  	@event = Event.find(attendance.event_id)
  	@url  = 'https://eventbis.herokuapp.com/' 
  	mail(to: @user.email, subject: "Vous allez participer à un evenement!") 
  end
end
