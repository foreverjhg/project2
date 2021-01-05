function score(text, callback) {
	var header = document.querySelector('header');
	var section = document.querySelector('section');

	var requestURL = 'http://127.0.0.1:5000/score';
	var request = new XMLHttpRequest();

	var param = 'text=' + text;
	request.open('POST', requestURL);
	request.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	request.responseType = 'json';
	request.send(param);

	request.onload = function() {
		var result = request.response;
		var probability = result["probability"];
		console.log(probability);
		callback(probability);
	}
}