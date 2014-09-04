function upVote() {
	$('.upvote').on('click', function(event) {
		event.preventDefault();

		var targetUrl = event.target.href;

		$.ajax({
			url: targetUrl,
			type: "GET"
		}).done(function(response) {
			dayId = response.day_id
			newScore = response.new_score
			$('#' + dayId).text(newScore);
		});
	});
}

function downVote() {
	$('.downvote').on('click', function(event) {
		event.preventDefault();

		var targetUrl = event.target.href;

		$.ajax({
			url: targetUrl,
			type: "GET"
		}).done(function(response) {
			dayId = response.day_id
			newScore = response.new_score
			$('#' + dayId).text(newScore);
		});
	});
}

