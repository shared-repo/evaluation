<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Evaluation Web</title>
<style type="text/css">
table { margin-top: 100px; }
tr { height: 100px; }
td { width: 100px; }
.numbers-row td {
	color: red;
	font-size: 20pt;
	font-weight: bold;
	text-align: center;
}
.numbers-row td:last-child { color: green; }
button { font-size: 25pt; font-weight: bold; color: purple; }
</style>
</head>
<body>

	<table border="1" style="margin: 100px auto">
		
		<tr>
			<td colspan="7">
				<button type="button" id="select-btn" style="width:100%;height:100px">당첨 예상 번호 뽑기</button>
			</td>
		</tr>
		<tr class="numbers-row">
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript">
	$(function() {
		$("#select-btn").on('click', function(event) {
			$.ajax({
				"url": "get-winning-numbers",
				"method": "get",
				"dataType": "json",
				"success" : function(data, status, xhr) {
					$('.numbers-row td').each(function(idx, td) {
						$(td).text(data[idx]);
					});
					
				},
				"error" : function(xhr, status, err) {
					alert('error');	
				}
			});
		});
	});
	</script>

</body>
</html>