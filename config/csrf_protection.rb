class CsrfProtection
  def incoming(message, request, callback)
    session_token = FAYE_TOKEN
    message_token = message['ext'] && message['ext'].delete('csrfToken')

    unless session_token == message_token
      message['error'] = '401::Access denied'
    end
    callback.call(message)
  end
end
