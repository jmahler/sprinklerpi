<div class="subfocus center" style="width: 400px">

  <?php
  # load all the schedules
  $schedules = array();

  $sched_dir = "$spkpi_dir/schedules/";
  $dh = opendir($sched_dir);
  if (! $dh) {
    exit();
  }

  while (($file = readdir($dh)) !== false) {
    $file = "$sched_dir/$file";
    if (is_file($file)) {
      $sched = yaml_parse_file($file);
      if ($sched) {
        array_push($schedules, $sched);
      } else {
        echo "ERROR parsing file '$file'\n";
        closedir($dh);
        exit();
      }
    }
  }
  closedir($dh);

  if (empty($schedules)) {
    echo "<p>(no schedules)</p>";
  } else {
    $sel_sched = 0;  # XXX
    $sched = array_values($schedules)[$sel_sched];
    echo "<p class=\"bold\">" . $sched['name'] . "</p>";
    ?>
    <table class="center">
      <tr><th>group valve</th><th>days</th><th>start time</th><th>run time</th></tr>
      <?php foreach ($sched['entries'] as $entry) { ?>
      <tr>
      <td><?php echo $entry['group'] . ";" . $entry['valve']; ?></td>
      <td><?php echo $entry['days']; ?></td>
      <td><?php echo $entry['start_time']; ?></td>
      <td><?php echo $entry['run_time']; ?></td>
      </tr>
      <?php } ?>
    </table>
  <?php } ?>

</div>
<?php
# vim:ts=2 sw=2 expandtab
?>
