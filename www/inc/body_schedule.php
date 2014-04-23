
<?php

# {{{ load all the schedules
$schedules = array();

$sched_dir = "$spkpi_dir/schedules/";
$dh = opendir($sched_dir);
if (! $dh) {
  exit();
}

while (($file = readdir($dh)) !== false) {

  if (preg_match("/\.swp$/", $file)) {
    continue;
  }

  $id = $file;
  $file = "$sched_dir/$file";
  if (is_file($file)) {
    $sched = yaml_parse_file($file);
    if ($sched) {
      $sched['id'] = $id;
      array_push($schedules, $sched);
    } else {
      echo "ERROR parsing file '$file'\n";
      closedir($dh);
      exit();
    }
  }
}
closedir($dh);
# }}}

# {{{ process $_POST, validate, update schedule else load default

# Find a ($sched) to select ($sel_sched) either from the
# $_POST data or by loading it from a file.

if (isset($_POST['form']) and $_POST['form'] === 'update')
{
  # Build a schedule object from the submitted data.
  # If it is valid, write it, oherwise set $err = 1.
  # It can be displayed using the $sched object.

  $sched_dir = "$spkpi_dir/schedules/";

  $err = 0;
  $errmsg = '';

  $sched = array();

  if (! isset($_POST['id'])) {
    exit("POST id missing");
  }
  $sched['id'] = htmlspecialchars($_POST['id']);

  $file = "$sched_dir/" . $sched['id'];
  # id is also used as the file name

  if (isset($_POST['name'])) {
    $sched['name'] = htmlspecialchars($_POST['name']);
  } else {
    $err = 1;
    $sched['name'] = "!(unkown)";
  }

  $sched['enabled'] = (isset($_POST['enabled']) and $_POST['enabled']) ? 1 : 0;

  $xgroups     = $_POST['group'];
  $xvalves     = $_POST['valve'];
  $xdays       = $_POST['days'];
  $xstart_time = $_POST['start_time'];
  $xrun_time   = $_POST['run_time'];
  $xdel        = (isset($_POST['del'])) ? $_POST['del'] : array();
  # 'x' denotes raw inputs, use htmlspecialchars

  $entries = array();
  for ($i = 0; ; $i++) {

    if (empty($xdays[$i]) and empty($xstart_time[$i])
          and empty($xrun_time[$i])) {
      break;
    }

    if (isset($xdel[$i]) and $xdel[$i]) {
      continue;
    }

    $entry['group']       = htmlspecialchars($xgroups[$i]);
    $entry['valve']       = htmlspecialchars($xvalves[$i]);
    $entry['days']        = htmlspecialchars($xdays[$i]);
    $entry['start_time']  = htmlspecialchars($xstart_time[$i]);
    $entry['run_time']    = htmlspecialchars($xrun_time[$i]);

    array_push($entries, $entry);
  }

  $sched['entries'] = $entries;
  $sel_sched = $sched['id'];

  if (!$err) {
    if (yaml_emit_file($file, $sched)) {
      # success
    } else {
      exit("yaml emit failed");
    }
  }
} else {
  # check if a schedule is selected, otherwise use default

  if (isset($_POST['selsched'])) {
    $sel_sched = htmlspecialchars($_POST['selsched']);
  } elseif (isset($_SESSION['selsched'])) {
    $sel_sched = ($_SESSION['selsched']);
  }
  unset($sched);
  if (isset($sel_sched)) {
    foreach ($schedules as $s) {
      if ($s['id'] === $sel_sched) {
        $sched = $s;
        break;
      }
    }
  }
  if (isset($sched)) {
    $_SESSION['selsched'] = $sel_sched;
  } else {
    if (!empty($schedules)) {
      # default: select first
      $sched = array_values($schedules)[0];
      $sel_sched = $sched['id'];
    } else {
      unset($sel_sched);
      unset($_SESSION['selsched']);
    }
  }
}

# }}}

?>

<div class="subfocus center" style="width: 450px">
  <form action="" method="POST">
  <input type="hidden" name="form" value="update">
  <?php
    # generate the html output
    if (empty($schedules)) {
      echo "<p>(no schedules)</p>";
    } else {
      ?>
      <input type="text" name="name" size=25
            class="iheader"
            value="<?php echo $sched['name']; ?>" />
      <div class="mtb">
      Enabled: <input type="checkbox" name="enabled" value="1"
        <?php if (isset($sched['enabled']) and $sched['enabled']) {
          echo "checked";
        } ?>
        />
      </div>
      <input type="hidden" name="id" value="<?php echo $sched['id']; ?>" />
      <table class="center">
        <tr><th>group</th><th>valve</th><th>days</th>
            <th>start time</th><th>run time</th>
            <th>del</th>
        </tr>
        <?php
        $n = 0;
        foreach ($sched['entries'] as $entry) { ?>
          <tr>
            <td>
              <select name="group[]">
                <?php for ($i = 1; $i <= 3; $i++) {
                  $sel = ($entry['group'] == $i) ? 'selected' : '';
                  echo "<option value=\"$i\" $sel>$i</option>\n";
                } ?>
              </select>
            </td>
            <td>
              <select name="valve[]">
                <?php for ($i = 1; $i <= 8; $i++) {
                  $sel = ($entry['valve'] == $i) ? 'selected' : '';
                  echo "<option value=\"$i\" $sel>$i</option>\n";
                } ?>
              </select>
            </td>
            <td><input type="text" name="days[]" size=9
                value="<?php echo $entry['days']; ?>" />
            </td>
            <td><input type="text" name="start_time[]" size=5
                value="<?php echo $entry['start_time']; ?>" />
            </td>
            <td><input type="text" name="run_time[]" size=5
                value="<?php echo $entry['run_time']; ?>" />
            </td>
            <td><input type="checkbox" name="del[<?php echo $n; ?>]"
              <?php if (isset($entry['del']) and $entry['del']) {
                echo "checked";
              } ?>
             />
            </td>
          </tr>
          <?php
          $n++;
        } ?>
        <tr>
          <td>
            <select name=group[]>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
            </select>
          </td>
          <td>
            <select name=valve[]>
              <?php for ($i = 1; $i <= 8; $i++) {
                echo "<option value=\"$i\">$i</option>\n";
              } ?>
            </select>
          </td>
          <td><input type="text" name="days[]" size=9 value="" /></td>
          <td><input type="text" name="start_time[]" size=5 value="" /></td>
          <td><input type="text" name="run_time[]" size=5 value="" /></td>
          <td></td>
        </tr>
      </table>
      <div style="height: 40px">
      <?php if ($err) { ?>
      <span class="err">*Errors in submission</span>
      <?php } ?>
      <span class="right" style="margin-right: 40px">
      <input type="submit" value="Submit" />
      <input type="button" value="Cancel" onclick="window.location.href=window.location.href" />
      </span>
      </div>
    <?php } ?>
  </form>
</div>

<div class="center" style="width: 450px; height: 40px">
  <span class="right">
  <form action="" method="POST">
  <input type="hidden" name="form" value="select">
  Select:&nbsp;
  <select name="selsched" onchange="this.form.submit()">
    <?php foreach ($schedules as $sched) {
      $name = $sched['name'];
      $en = ($sched['enabled']) ? 'enabled' : 'disabled';
      $id = $sched['id'];
      $selected = ($id === $sel_sched) ? 'selected' : '';
      echo "<option value=\"$id\" $selected>$name ($en)</option>\n";
    } ?>
    <option value="new">New Schedule</option>
  </select>
  </form>
  </span>
</div>

<?php
# vim:ts=2 sw=2 expandtab
?>