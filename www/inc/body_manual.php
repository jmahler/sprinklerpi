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
<?php
# vim:ts=2 sw=2 expandtab
?>
