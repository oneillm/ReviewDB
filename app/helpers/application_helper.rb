module ApplicationHelper
	def title(page_title)
		content_for(:title) {page_title}
        end
        def hinted_text_field_tag(name, value = nil, hint = "Click and enter text", options={})
                value = value.nil? ? hint : value
                text_field_tag name, value, {:onclick => "if($(this).value == '#{hint}') {$(this).value = nil}", :onblur => "if($(this).value == ''){$(this).value = '#{hint}'}" }.update(options.stringify_keys)
        end
        def javascript(*files)
  		content_for(:head) { javascript_include_tag(*files) }
	end

	def stylesheet(*files)
  		content_for(:head) { stylesheet_link_tag(*files) }
	end
 
        def bootstrap_class_for flash_type
            case flash_type
                when :success
                   "alert-success"
                when :error
                   "alert-danger"
                when :alert
                   "alert-warning"
                when :notice
                   "alert-info"
                else
                   flash_type.to_s
            end
        end
       def tooltip_for(text, &block)
    	content = capture(&block)
    	content_tag :div, class: "tooltip_wrapper" do
      	content + content_tag(:div, content_tag(:div, "", class: "tooltip_triangle") + text, class: "helper_tooltip")
       end
  end

end
