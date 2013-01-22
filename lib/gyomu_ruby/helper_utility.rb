module GyomuRuby::HelperUtility

  def human(klass, attribute = nil)
    if attribute
      klass.human_attribute_name(attribute)
    else
      klass.model_name.human
    end
  end

  def routed_to?(*signatures)
    [controller_name, action_name].join('#').in?(Array(signatures))
  end

  def nice_datetime_duration(from, to, join_word = ' - ')
    from, to = [from, to].map(&:localtime)

    if from.localtime.to_date == to.localtime.to_date
      [l(from), to.strftime("%H:%M")]
    else
      [l(from), l(to)]
    end.join(join_word)
  end

  def with_paging(objects, opts = {}, &block)
    inner = capture { block.call(objects) }
    render partial: 'shared/paging', locals: {objects: objects, inner: inner, opts: opts}
  end

end
