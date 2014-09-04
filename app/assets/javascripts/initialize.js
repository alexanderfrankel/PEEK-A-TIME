var ready = function() {
	upVote();
	downVote();
};

$(document).ready(ready);
$(document).on('page:load', ready);