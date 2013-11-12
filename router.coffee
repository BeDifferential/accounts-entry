Router.map ->

  @route "entrySignIn",
    path: "/sign-in"
    before: ->
      Session.set('entryError', undefined)
      Session.set('buttonText', 'in')

  @route "entrySignUp",
    path: "/sign-up"
    before: ->
      Session.set('entryError', undefined)
      Session.set('buttonText', 'up')
    after: ->
      if Accounts._options['forbidClientAccountCreation'] 
        Router.go  "entrySignIn"


  @route "entryForgotPassword",
    path: "/forgot-password"
    before: ->
      Session.set('entryError', undefined)

  @route 'entrySignOut',
    path: '/sign-out'
    before: ->
      if AccountsEntry.settings.homeRoute
        Meteor.logout()
        Router.go AccountsEntry.settings.homeRoute
      @stop()
