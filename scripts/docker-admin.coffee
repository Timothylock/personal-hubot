module.exports = (robot) ->
  robot.respond /docker restart/, (msg) ->
    @exec = require('child_process').exec
    msg.send "Killing docker containers..."

    @exec "sh /home/timothy/service-monolith/killAll.sh", (error, stdout, stderr) -> 
        if error
            msg.send "```" + error + "```"
            msg.send "```" + stderr + "```"
        else
            msg.send "```" + stdout + "```"

            msg.send "Starting containers..."
            @exec "sh /home/timothy/service-monolith/startServer.sh", (error, stdout, stderr) -> 
            if error
                msg.send "```" + error + "```"
                msg.send "```" + stderr + "```"
            else
                msg.send "```" + stdout + "```"
                msg.send "Completed! W00t!"

  robot.respond /docker update/, (msg) ->
    @exec = require('child_process').exec
    msg.send "Updating docker containers with their newest images..."

    @exec "sh /home/timothy/service-monolith/updateServer.sh", (error, stdout, stderr) -> 
        if error
            msg.send "```" + error + "```"
            msg.send "```" + stderr + "```"
        else
            msg.send "```" + stdout + "```"
            msg.send "Complete!"