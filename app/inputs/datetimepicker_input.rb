class DatetimepickerInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    first_level_template(merged_input_options)
  end

  def input_html_options
    super.merge(
      data: { target: "##{attribute_name}" },
      value: format_value(object.public_send(attribute_name))
    )
  end

  def first_level_template(merged_input_options)
    template.content_tag(:div, first_level_opts) do
      template.concat @builder.text_field(attribute_name, merged_input_options)
      template.concat second_level_template
    end
  end

  def second_level_template
    template.content_tag(:div, second_level_opts) do
      template.concat third_level_template
    end
  end

  def third_level_template
    template.content_tag(:div, class: 'input-group-text') do
      template.concat "<i class='fa fa-calendar'></i>".html_safe
    end
  end

  def first_level_opts
    {
      id: attribute_name,
      class: 'input-group date',
      data: {
        input: 'datetimepicker',
        'target-input': 'nearest'
      }
    }
  end

  def second_level_opts
    {
      class: 'input-group-append',
      data: {
        target: "##{attribute_name}",
        toggle: 'datetimepicker'
      }
    }
  end

  def format_value(value)
    l(value, format: '%d-%m-%Y %H:%M') if value.present?
  end
end
