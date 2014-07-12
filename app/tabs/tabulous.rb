Tabulous.setup do

  tabs do

  sigin_tab do
      text          { 'Admin sign in' }
      link_path     { signin_path }
      visible_when  { !login_signed_in? }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('new_login_session') }
    end
  ssdmappings_tab do
      text          { 'Integration Mapping' }
      link_path     { ssdmappings_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('ssdmappings') }
    end

    socialmediasites_tab do
      text          { 'API Management' }
      link_path     { socialmediasites_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('socialmediasites') }
    end

    businesses_tab do
      text          { 'Business Profile' }
      link_path     { businesses_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('businesses') }
    end

    logins_tab do
      text          { 'User Profile' }
      link_path     { logins_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('logins') }
    end

    home_tab do
      text          { 'Logout' }
      link_path     { logout_path }
      visible_when  { login_signed_in? }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('home') }
    end

  end

  customize do

    # which class to use to generate HTML
    # :default, :html5, :bootstrap, :bootstrap_pill or :bootstrap_navbar
    # :default, :bootstrap_navbar
    # or create your own renderer class and reference it here
     renderer :bootstrap_navbar

    # whether to allow the active tab to be clicked
    # defaults to true
     active_tab_clickable true

    # what to do when there is no active tab for the current controller action
    # :render -- draw the tabset, even though no tab is active
    # :do_not_render -- do not draw the tabset
    # :raise_error -- raise an error
    # defaults to :do_not_render
     when_action_has_no_tab :render

    # whether to always add the HTML markup for subtabs, even if empty
    # defaults to false
    render_subtabs_when_empty true

  end

  # The following will insert some CSS straight into your HTML so that you
  # can quickly prototype an app with halfway-decent looking tabs.
  #
  # This scaffolding should be turned off and replaced by your own custom
  # CSS before using tabulous in production.
  use_css_scaffolding do
    background_color '#ccc'
    text_color '073CA5'
    active_tab_color '#fff'
    hover_tab_color '#ddd'
    inactive_tab_color '#aaa'
    inactive_text_color '#888'
  end

end
