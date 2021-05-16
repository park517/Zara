<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>

	let msg = '${msg}';
	let url = '${url}';
	let back = '${back}';

	if (msg) {
		alert(msg);
	}
	if ( url ) {
		location.replace(url);
	}
	
	if ( back ) {
		location.href = document.referrer;
	}
</script> 
