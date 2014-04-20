<!DOCTYPE html>
<?php
include '_config.inc';

$self = "index.php";
$modes = ["manual", "off", "demo"];

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
  exit($spkpi->errmsg);
}

# write any differences to the files
$err = $new_spkpi->write_state_diff($spkpi);
if ($err) {
  exit($spkpi->errmsg);
}

# use the new object for rest of script
$spkpi = $new_spkpi;
?>
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
    case "manual":
      include 'body_manual.php';
      break;
    case "off":
      include 'body_off.php';
      break;
    case "demo":
      include 'body_demo.php';
      break;
  } ?>
</div>

</body>
</html>

<?php
# vim:ts=2 sw=2 expandtab
?>
