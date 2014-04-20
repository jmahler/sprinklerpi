<!DOCTYPE html>
<html>
<?php #set_include_path(get_included_path() . PATH_SEPARATOR . 'lib/'; ?>
<head>
<link rel="stylesheet" type="text/css" href="main.css" />
<title>SprinklerPI: manual mode</title>
</head>
<body>

<?php
include '_config.inc';

$spkpi = new SprinklerPI($spkpi_dir);

$err = $spkpi->read_state();
if ($err) {
  exit($spkpi->errmsg);
}

$new_spkpi = clone $spkpi;
$err = $new_spkpi->process_post_state();
if ($err) {
  exit($spkpi->errmsg);
}

$err = $new_spkpi->write_state_diff($spkpi);
if ($err) {
  exit($spkpi->errmsg);
}

$spkpi = $new_spkpi;

$self = "index.php";
$modes = ["manual", "off", "demo"];
?>

<div class="header">
  <span class="left title">SprinklerPI</span>
  <span class="right">
    <form action="" method="POST">
      <span class="bold">Mode:
      <select name="mode" class="modeform" onchange="this.form.submit()">
      <?php
      foreach ($modes as $mode) {
        if ($mode == $spkpi->mode) {
          echo "<option value=\"$mode\" selected>$mode</option>\n";
        } else {
          echo "<option value=\"$mode\">$mode</option>\n";
        }
      }
      ?>
      </select>
      </span>
    </form>
  </span>
</div>

<div class="focus center">

  <?php if ($spkpi->mode == "manual") { ?>
  <div>
  <form action="" method="POST">
  <table class="group_valve center">
  <tr><th><p>group</p></th><th><p>valve</p></th></tr>
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
  </div>
  <?php } ?>
</div>

</body>
</html>

<?php
# vim:ts=2 sw=2 expandtab
?>
