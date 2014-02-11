AccountsEntry =
  settings:
    wrapLinks: true
    homeRoute: '/home'
    dashboardRoute: '/dashboard'
    passwordSignupFields: 'EMAIL_ONLY'

  config: (appConfig) ->
    @settings = _.extend(@settings, appConfig)

    i18n.setDefaultLanguage "en"
    if appConfig.language
      i18n.setLanguage appConfig.language

    if appConfig.signUpTemplate
      route = _.find Router.routes, (e) ->
        e.name is 'entrySignUp'
      route.options.template = appConfig.signUpTemplate

@AccountsEntry = AccountsEntry
