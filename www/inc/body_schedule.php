
<?php

# {{{ new_blank_schedule()
/**
 * Create a new blank schedule object along
 * with a new unique id.
 */
function new_blank_schedule() {

  $sched_id = date("Ymdhis");
  $sched_id = $sched_id . ".yml";
  # unique id is also the file name

  $sched = array(
    'id' => $sched_id,
    'enabled' => 0,
    'name' => "New Schedule",
    'entries' => array(
      array(  'group' => "1",
              'valve' => "1",
              'days'  => "MTWThFSSu",
              'start_time' => date("H:i"),
              'run_time' => "5:00"),
    ),
  );

  return $sched;
}
# }}}

$sched_dir = "$spkpi_dir/schedules/";
$err = 0;
$errmsg = '';

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
unset($sched);
# }}}

# {{{ $_POST -> select, new schedule
if (isset($_POST['form'])
      and $_POST['form'] === 'select'
      and $_POST['selsched'] === 'new') {

  $sched     = new_blank_schedule();
}
# }}}

# {{{ $_POST -> select existing schedule
if (isset($_POST['form'])
      and $_POST['form'] === 'select'
      and $_POST['selsched'] !== 'new') {

  $sel_sched = htmlspecialchars($_POST['selsched']);

  # make sure it exists
  $found = 0;
  foreach ($schedules as $s) {
    if ($s['id'] === $sel_sched) {
      $found = 1;
      $sched = $s;
      break;
    }
  }
  if (! $found) {
    unset($sched);
    unset($sel_sched);
  }

  if (isset($sel_sched)) {
    $_SESSION['selsched'] = $sel_sched;
  }
}
# }}}

# {{{ $_POST -> update/new schedule

function format_time($x) {
  $parts = split(":", $x, 2);

  $pos =strpos($x, ":");
  if (FALSE === $pos) {
    $x = sprintf("%02d:00", $x);
  } else {
    $a = substr($x, 0, $pos);
    $b = substr($x, $pos + 1);
    $x = sprintf("%02d:%02d", $a, $b);
  }

  return $x;
}

if (isset($_POST['form']) and $_POST['form'] === 'update') {

  $sched = array();

  $sched['id'] = htmlspecialchars($_POST['id']);
  $sched['name'] = htmlspecialchars($_POST['name']);
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

    # end when these values are empty
    if (empty($xdays[$i]) and empty($xstart_time[$i])
          and empty($xrun_time[$i])) {
      break;
    }

    # delete entries by skipping
    if (isset($xdel[$i]) and $xdel[$i]) {
      continue;
    }

    $entry['group']       = htmlspecialchars($xgroups[$i]);
    $entry['valve']       = htmlspecialchars($xvalves[$i]);
    $entry['days']        = htmlspecialchars($xdays[$i]);
    $entry['start_time']  = htmlspecialchars($xstart_time[$i]);
    $entry['run_time']    = htmlspecialchars($xrun_time[$i]);

    $entry['start_time']  = format_time($entry['start_time']);
    $entry['run_time']    = format_time($entry['run_time']);

    array_push($entries, $entry);
  }
  $sched['entries'] = $entries;

  $sel_sched = $sched['id'];

  if (!$err) {
    if (isset($_POST['apply'])) {
      $file = "$sched_dir/" . $sched['id'];
      if (yaml_emit_file($file, $sched)) {
        # success
      } else {
        exit("yaml emit failed, are permissions for '$file' correct?");
      }
    } else if (isset($_POST['run_once'])) {
      foreach ($entries as $entry) {
        $group = $entry['group'];
        $queue_file = "$spkpi_dir/queue/group-" . $group;
        $valve = $entry['valve'];

        $run_time_fmt = $entry['run_time'];
        list($min, $_sec) = sscanf($run_time_fmt, "%02d:%02d");
        $run_time = $min*60 + $_sec;

        $cmd = "echo \"$valve $run_time\" >> $queue_file";
        $status = '';
        $output = array();
        $res = exec($cmd, $output, $status);
        if ($status)
			    exit("exec of '$cmd' failed. Are the file permissions correct?\n");
      }
    }
  }

  if (isset($sel_sched)) {
    $_SESSION['selsched'] = $sel_sched;
  }

  # update the previously loaded $schedules
  $found = 0;
  foreach ($schedules as &$_sched) {
    if ($_sched['id'] === $sel_sched) {
      $found = 1;
      $_sched = $sched;
      break;
    }
  }
  if (!$found) {
    array_push($schedules, $sched);
  }
}
# }}}

# {{{ set $sel_sched if unset
if (!isset($sel_sched)) {

  if (isset($_SESSION['selsched'])) {
    $sel_sched = $_SESSION['selsched'];

    $found = 0;
    foreach ($schedules as $_sched) {
      if ($sel_sched === $_sched['id']) {
        $found = 1;
        break;
      }
    }
    if (! $found) {
      unset($sel_sched);
      unset($_SESSION['selsched']);
    }
  }

  if(!isset($sel_sched)) {
    if (! empty($schedules)) {
      $_sched = array_values($schedules)[0];
      $sel_sched = $_sched['id'];
    }
  }
}
# }}}

# {{{ set $sched if unset
if (!isset($sched)) {
  foreach ($schedules as $sched) {
    if ($sched['id'] === $sel_sched) {
      break;
    }
  }
}
# }}}

# {{{ view
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
                  echo "<option value=\"$i\" $sel>$i</option>";
                } ?>
              </select>
            </td>
            <td>
              <select name="valve[]">
                <?php for ($i = 1; $i <= 8; $i++) {
                  $sel = ($entry['valve'] == $i) ? 'selected' : '';
                  echo "<option value=\"$i\" $sel>$i</option>";
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
                echo "<option value=\"$i\">$i</option>";
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
      <input type="button" value="Cancel" onclick="window.location.href=window.location.href" />
      <input type="submit" name="apply" value="Apply" />
      <input type="submit" name="run_once" value="Run Once" />
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
    <option value="new">New Schedule</option>
    <?php foreach ($schedules as $sched) {
      $name = $sched['name'];
      $en = ($sched['enabled']) ? 'enabled' : 'disabled';
      $id = $sched['id'];
      $selected = ($id === $sel_sched) ? 'selected' : '';
      echo "<option value=\"$id\" $selected>$name ($en)</option>";
    } ?>
  </select>
  </form>
  </span>
</div>
<?php # }}}

# vim:ts=2 sw=2 expandtab
?>
