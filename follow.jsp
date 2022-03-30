<script type="text/javascript">
	$(function() {
		$(".follow").click(function() {
			var element = $(this);
			var I = element.attr("id");
			var info = 'id=' + I;
			$("#loading").html('<img src="loader.gif" >');

			$.ajax({
				type : "POST",
				url : "follow.jsp",
				data : info,
				success : function() {
					$("#loading").ajaxComplete(function() {
					}).slideUp();
					$('#follow' + I).fadeOut(200).hide();
					$('#remove' + I).fadeIn(200).show();
				}
			});
			return false;
		});
	});
</script>

<script type="text/javascript">
	$(function() {
		$(".remove").click(function() {
			var element = $(this);
			var I = element.attr("id");
			var info = 'id=' + I;

			$.ajax({
				type : "POST",
				url : "unfollow.jsp",
				data : info,
				success : function() {
					$("#loading").ajaxComplete(function() {
					}).slideUp();
					$('#remove' + I).fadeOut(200).hide();
					$('#follow' + I).fadeIn(200).show();
				}
			});
			return false;
		});
	});
</script>

<?php
$sql=mysql_query("Some SQL Statement");
while($row=mysql_fetch_array($sql))
{
$id=$row["user_id"];
?>
<div id="follow<?php echo $id;?>">
	<a href="#" class="follow" id="<?php echo $id;?>"> <span
		class="follow_b"> Follow </span></a>
</div>
<div id="remove<?php echo $id;?>" style="display: none">
	You Following <a href="#" class="remove" id="<?php echo $id;?>"> <span
		class="remove_b"> remove </span></a>
</div>
<?php
}
?>