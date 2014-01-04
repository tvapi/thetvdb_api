module StubFaraday
  def stub_request(model, args)
    model.connection.instance_variable_get('@builder').handlers.first.instance_variable_set('@args', args)
  end
end