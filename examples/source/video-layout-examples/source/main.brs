'*************************************************************
'** Video Layout Examples 
'** Copyright (c) 2015 Roku, Inc.  All rights reserved.
'** Use of the Roku Platform is subject to the SDK License Agreement:
'** https://docs.roku.com/doc/developersdk/en-us
'*************************************************************

' This is the function called by the Roku device to start this channel
sub Main()
    print chr(10) + "======================== CHANNEL STARTING =========================" + chr(10)

    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)
    scene = screen.CreateScene("MainScene")
    screen.show()

    scene.observeField("currentTest", m.port)

    while(true)
        msg = wait(0, m.port)
        ' print "msg: " + roToString(msg)
	    msgType = type(msg)
        if msgType = "roSGNodeEvent"
            if msg.getField()= "currentTest"
                print "Test selected: " + roToString(msg.getData())
            end if
        else if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        end if
    end while
end sub

