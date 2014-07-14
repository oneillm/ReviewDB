require 'active_support/core_ext/string'
module Tabulous  

  class CustomNavRenderer < BootstrapNavbarRenderer

    def tab_link(tab)
      html = ''
      if tab.clickable?(@view) && tab.enabled?(@view)
        html << %Q{<a data-toggle="tooltip" data-original-title="test only" href="#{tab_url(tab)}" #{tab_http_verb_attributes(tab) }>#{tab_text(tab)}</a>}
        html << %Q{<ul class="list-inline">}
      else
        html << %Q{<a>#{tab_text(tab)}</a>}
      end
      html
  end
end
end
