<html>
<?php #set_include_path(get_included_path() . PATH_SEPARATOR . 'lib/'; ?>
<head>
<title>SprinklerPI: manual mode</title>
</head>
<body>

<?php
include '_config.inc';

$spkpi = new SprinklerPI($spkpi_dir);

$err = $spkpi->read_state();
if ($err) {
	echo "<p>" . $spkpi->errmsg . "</p>";
}

$err = $spkpi->process_post_state();
if (! $err) {
	$spkpi->set_state();
} else {
	echo "<p>" . $spkpi->errmsg . "</p>";
	$spkpi->read_state();  # read previous state
}

$self = "index.php";
$modes = ["manual", "off", "demo"];
?>

<form action="" method="POST">
Mode:
<select name="mode" id="modeform" onchange="this.form.submit()">
<?php
foreach ($modes as $mode) {
	if ($mode == $spkpi->mode) {
		echo "	<option value=\"$mode\" selected>$mode</option>\n";
	} else {
		echo "	<option value=\"$mode\">$mode</option>\n";
	}
}
?>
</select>
</form>

<?php if ($spkpi->mode == "manual") { ?>
<form action="" method="POST">
<table>
<tr><th>group</th><th>valve</th></tr>
<?php
for ($group = 1; $group <= 3; $group++) {
	$group_name = "group" . $group;
?>
	<tr>
		<td><?php echo $group; ?></td>
		<td><select name="<?php echo $group_name; ?>" id="<?php echo $group; ?>form" onchange="this.form.submit()">
		<option value="0">0 (off)</option>
		<?php
		for ($valve = 1; $valve <= 8; $valve++) {
			if ($valve == $spkpi->valves[$group]) {
				echo "<option value=\"$valve\" selected>$valve</option>";
			} else {
				echo "<option value=\"$valve\">$valve</option>";
			}
		}
		?>
		</select>
		</td>
	</tr>
<?php
}
?>
</table>
</form>
<?php } ?>

</body>
</html>

