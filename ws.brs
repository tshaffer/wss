Sub Main()

  msgPort = CreateObject("roMessagePort")
  r = CreateObject("roRectangle", 0, 0, 1920, 1080)

  aa = {}

  aa.nodejs_enabled = true
  aa.inspector_server = {port:2999}
  aa.hwz_default = "on"
  aa.javascript_enabled = true
  aa.focus_enabled = true
  aa.mouse_enabled = true
  aa.brightsign_js_objects_enabled = true

  security = {}
  security.websecurity = false
  security.camera_enabled = false
  security.insecure_https_enabled = false
  aa.security_params = security

  aa.port = msgPort

  aa.url = "file:///subs/index.html"

  h = CreateObject("roHtmlWidget", r, aa)
  h.SetPort(msgPort)

  m.htmlWidget = h
  m.imagePlayer = CreateObject("roImageWidget", r)

  EventLoop(msgPort, m.imagePlayer)

End Sub


Sub EventLoop(msgPort, imagePlayer)

  print "enter EventLoop"
  print type(msgPort)

  while true

    event = wait(0, msgPort)

    print "message received"
    print type(event)

    if type(event) = "roHtmlWidgetEvent" then

      eventData = event.GetData()
      if type(eventData) = "roAssociativeArray" and type(eventData.reason) = "roString" then
        print eventData.reason
        if eventData.reason = "load-finished" then
          print "load finished"
          imagePlayer.show()
        endif
      endif

    endif

  end while

End Sub
