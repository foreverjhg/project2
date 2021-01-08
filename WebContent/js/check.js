 function check(category, url, callback) {
        console.log("category: " + category);
        console.log("url: " + url);
        
        var requestURL = 'http://119.200.190.100:5000/check';
        var request = new XMLHttpRequest();
        
        var param = 'category='+category+"&url="+url;
        
        request.open('POST', requestURL);
        request.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        request.responseType = 'json';
        request.send(param);
        
        request.onload = function() {
            var result = request.response; 
            var returnCode = result["returnCode"];
            console.log("returnCode: " + returnCode);

            callback(returnCode);
        }
    }
    