<?php
/**
 * The SprinklerPI class is used to read and store the
 * state of the sprinklerpi files.
 *
 *   $spkpi = new SprinklerPI($spkpi_dir);
 *   
 *   $err = $spkpi->read_state();
 *   if ($err) {
 *   	echo "<p>" . $spkpi->errmsg . "</p>";
 *   }
 *   
 *   $err = $spkpi->process_post_state();
 *   if (! $err) {
 *   	$spkpi->set_state();
 *   } else {
 *   	echo "<p>" . $spkpi->errmsg . "</p>";
 *   	$spkpi->read_state();  # read previous state
 *   }
 */
class SprinklerPI {
	public $mode = 'off';
	public $spkpi_dir = '';
	public $modes = ["manual", "off", "demo"];
	public $errmsg;
	public $valves = [1 => 0, 2 => 0, 3 => 0];

	/**
	 * Creates a new SprinklerPI object with default values.
	 *
	 *   $spkpi_dir = "../sprinklerpi";
	 *   $spkpi = new SprinklerPI($spkpi_dir);
	 */
	public function __construct($_spkpi_dir) {
		$this->spkpi_dir = $_spkpi_dir;
	}

	/**
	 * Process $_POST data and update the object state.
	 *
	 *   Returns: -1 on error, 0 on success
	 *
	 *   $err = $spkpi->process_post_state();
	 *   if (-1 == $err) {
	 *		echo $spkpi->errmsg;
	 *   }
	 */
	public function process_post_state()
	{
		$err = 0;

		# mode
		if (isset($_POST['mode'])) {
			$mode = htmlspecialchars($_POST['mode']);
			if (in_array($mode, $this->modes)) {
				$this->mode = $mode;
			} else {
				$errmsg = "Invalid mode.";
				return -1; # error
			}
		}

		# group valves
		for ($group = 1; $group <= 3; $group++) {
			$group_name = "group" . $group;
			$valve = 0;
			if (isset($_POST[$group_name])) {
				$valve = htmlspecialchars($_POST[$group_name]);

				if (is_numeric($valve) and $valve >= 0 and $valve <= 8) {
					$this->valves[$group] = $valve;
				} else {
					$err = -1;
					$this->errmsg = "Invalid valve from post";
				}
			}
		}

		return $err;
	}

	/**
	 * Write the current object state to the files.
	 *
	 *   Returns: -1 on error, 0 on success
	 *
	 *   $err = $spkpi->set_state();
	 *   if (-1 == $err) {
	 *		echo $spkpi->errmsg;
	 *   }
	 */
	public function set_state() {

		# mode
		$mode = $this->mode;
		$file  = $this->spkpi_dir . "/mode";
		exec("echo $mode > $file");

		# valves
		$dir  = $this->spkpi_dir . "/manual";
		foreach ($this->valves as $group => $valve) {
			$file = "$dir/valve-$group";
			exec("echo $valve > $file");
		}
	}

	/**
	 * Read the state from files and load them
	 * in to the object.
	 *
	 *   Returns: -1 on error, 0 on success
	 *
	 *   $err = $spkpi->read_state();
	 *   if (-1 == $err) {
	 *		echo $spkpi->errmsg;
	 *   }
	 */
	public function read_state()
	{
		$err = 0;

		$this->mode = exec("cat " . $this->spkpi_dir . "/mode");

		$dir  = $this->spkpi_dir . "/manual";
		foreach ($this->valves as $group => $valve) {
			$file = "$dir/valve-$group";
			$valve = exec("cat $file");

			if (is_numeric($valve) and $valve >= 0 and $valve <= 8) {
				$this->valves[$group] = $valve;
			} else {
				$err = -1;
				$this->errmsg = "Invalid valve specification '$file'";
			}
		}

		return $err;
	}
}
?>
