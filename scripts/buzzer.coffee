module.exports = (robot) ->
  robot.hear /open the pod bay doors/i, (res) ->
    data = JSON.stringify({
    active: 'true'
    })
    robot.http("http://127.0.0.1:10050/buzzer/state")
        .header('Content-Type', 'application/json')
        .post(data) (err, resp, body) ->
            if err
                res.send "I'm afraid I can't do that Dave #{err}"
                return
            else
                robot.messageRoom "notifications-buzzer", "Buzzer has been unlocked for the next 30 minutes"
                res.send "Sure, Dave. I will let people in for the next 30 minutes"
  robot.hear /bidoof open/i, (res) ->
    data = JSON.stringify({
    active: 'true'
    })
    robot.http("http://127.0.0.1:10050/buzzer/state")
        .header('Content-Type', 'application/json')
        .post(data) (err, resp, body) ->
            if err
                res.send "I'm afraid I can't do that Dave #{err}"
                return
            else
                robot.messageRoom "notifications-buzzer", "Buzzer has been unlocked for the next 30 minutes"
                res.send "Sure, Dave. I will let people in for the next 30 minutes"
