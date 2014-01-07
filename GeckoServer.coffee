page = require("webpage").create() # spin up a web page
webserverTest = require("webserver").create() # http://docs.slimerjs.org/current/api/webserver.html
webserverTest.listen 8083, (request, response) ->
  if request.url is "/ping.html"
    response.statusCode = 200
    response.write "slimerjs server is listening\n"
    response.close()
  else
    
    # ../ does not work on the beginning position, so replace with direct link
    page.open("../local-copies/html-converted/" + request.queryString + "/" + request.queryString + ".html").then (status) ->
      if status is "success"
        console.log request.queryString
        console.log request.path
        response.statusCode = 200
        response.write "page loaded by slimerjs"
        response.close()
      else
        response.statusCode = 500
        response.write "page could not be found by slimerjs"
        response.close()
        console.log "page could not be found by slimerjs"
      page.close()



#...
