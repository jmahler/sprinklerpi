<?php
include '_config.inc';

$self = "index.php";
$modes = ["off", "manual", "schedule", "demo"];

$spkpi = new SprinklerPI($spkpi_dir);

# read current state of files
$err = $spkpi->read_state();
if ($err) {
  exit($spkpi->errmsg);
}

# process the $_POST variables in to a new object
$new_spkpi = clone $spkpi;
$err = $new_spkpi->process_post_state();
if ($err) {
  exit($new_spkpi->errmsg);
}

# write any differences to the files
$err = $new_spkpi->write_state_diff($spkpi);
if ($err) {
  exit($new_spkpi->errmsg);
}

# use the new object for rest of script
$spkpi = $new_spkpi;
?>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="main.css" />
    <title>SprinklerPI: (<?php echo $spkpi->mode; ?>)</title>
  </head>
<body>

<div class="header">
  <span class="left title">SprinklerPI</span>
  <span class="right">
    <form action="" method="POST">
      <span class="bold">Mode:
      <select name="mode" class="modeform" onchange="this.form.submit()">
      <?php foreach ($modes as $mode) {
        if ($mode == $spkpi->mode) {
          echo "<option value=\"$mode\" selected>$mode</option>\n";
        } else {
          echo "<option value=\"$mode\">$mode</option>\n";
        }
      } ?>
      </select>
      </span>
    </form>
  </span>
</div>

<div class="focus center">
  <?php switch ($spkpi->mode) {
    case "off":
      include 'body_off.php';
      break;
    case "manual":
      include 'body_manual.php';
      break;
    case "schedule":
      include 'body_schedule.php';
      break;
    case "demo":
      include 'body_demo.php';
      break;
  } ?>
<br>
<br>
<span class="tiny center">
<a href="http://github.com/jmahler/sprinklerpi">github.com/jmahler/sprinklerpi</a>
</span>
</div>


</body>
</html>

<?php
# vim:ts=2 sw=2 expandtab
?>
