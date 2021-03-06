<?php
/**
 * NAME
 * ----
 *
 * sprinklerpi.php - SprinklerPI class library.
 *
 * DESCRIPTION
 * -----------
 *
 * The SprinklerPI class is used to read and store the
 * state of the sprinklerpi files.
 *
 *   $spkpi = new SprinklerPI($spkpi_dir);
 *   
 *   $err = $spkpi->read_state();
 *   if ($err) {
 *   	exit($spkpi->errmsg);
 *   }
 *
 *   $new_spkpi = clone $spkpi;
 *   $err = $new_spkpi->process_post_state();
 *   if ($err) {
 *   	exit($spkpi->errmsg);
 *   }
 *
 *   $err = $new_spkpi->write_state_diff($spkpi);
 *   if ($err) {
 *   	exit($spkpi->errmsg);
 *   }
 *
 *   $spkpi = $new_spkpi;
 *
 * AUTHOR
 * ------
 *
 *  Jeremiah Mahler <jmmahler@gmail.com>
 *  http://github.com/jmahler
 *
 * COPYRIGHT
 * --------
 *
 * Copyright (c) 2014, Jeremiah Mahler. All Rights Reserved.
 * This module is free software.  It may be used, redistributed
 * and/or modified under the same terms as Perl itself.
 *
 */
class SprinklerPI {
	public $mode = 'off';
	public $spkpi_dir = '';
	public $modes = ["off", "manual", "schedule"];
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
				$this->errmsg = "Mode '$mode' not supported by library.\n" . "file: " . __FILE__ . ", line: " . __LINE__;
				return -1; # error
			}
		}

		# group valves
		for ($group = 1; $group <= 3; $group++) {
			if ($this->mode === 'off') {
				$this->valves[$group] = 0;
			} else {
				$valve = 0;
				$group_name = "group" . $group;
				if (isset($_POST[$group_name])) {
					$valve = htmlspecialchars($_POST[$group_name]);

					if (is_numeric($valve) and $valve >= 0 and $valve <= 8) {
						$this->valves[$group] = $valve;
					} else {
						$err = -1;
						$this->errmsg = "Invalid valve '$valve'\n" . "file: " . __FILE__ . ", line: " . __LINE__;
					}
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
	 *   $err = $spkpi->write_state();
	 *   if (-1 == $err) {
	 *		echo $spkpi->errmsg;
	 *   }
	 */
	public function write_state()
	{
		# mode
		$mode = $this->mode;
		$file = $this->spkpi_dir . "/mode";

		$status = '';
		$output = array();
		$cmd = "echo $mode > $file";
		$res = exec($cmd, $output, $status);
		if ($status)
			exit("exec of '$cmd' failed. Are the file permissions correct?\n");

		# valves
		$dir  = $this->spkpi_dir . "/valves";
		foreach ($this->valves as $group => $valve) {
			$file = "$dir/group-$group";

			$status = '';
			$output = array();
			$cmd = "echo $valve > $file";
			$res = exec($cmd, $output, $status);
			if ($status)
				exit("exec of '$cmd' failed. Are the file permissions correct?\n");
		}
	}

	/**
	 * Write the differences between two objects to the files.
	 *
	 *   Returns: -1 on error, 0 on success
	 *
	 *   $err = $new->write_state_diff($old);
	 *   if (-1 == $err) {
	 *		echo $spkpi->errmsg;
	 *   }
	 */
	public function write_state_diff($old)
	{
		# mode
		if ($this->mode != $old->mode) {
			$mode = $this->mode;
			$file = $this->spkpi_dir . "/mode";

			$status = '';
			$output = array();
			$cmd = "echo $mode > $file";
			$res = exec($cmd, $output, $status);
			if ($status)
				exit("exec of '$cmd' failed. Are the file permissions correct?\n");
		}

		# valves
		$dir = $this->spkpi_dir . "/valves";
		foreach ($this->valves as $group => $valve) {
			if ($valve != $old->valves[$group]) {
				$file = "$dir/group-$group";

				$status = '';
				$output = array();
				$cmd = "echo $valve > $file";
				$res = exec($cmd, $output, $status);
				if ($status)
					exit("exec of '$cmd' failed. Are the file permissions correct?\n");
			}
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

		$dir  = $this->spkpi_dir . "/valves";
		foreach ($this->valves as $group => $valve) {
			$file = "$dir/group-$group";
			$valve = exec("cat $file");

			if (is_numeric($valve) and $valve >= 0 and $valve <= 8) {
				$this->valves[$group] = $valve;
			} else {
				$err = -1;
				$this->errmsg = "Invalid valve specification in file '$file'.\n" . "file: " . __FILE__ . ", line: " . __LINE__;
			}
		}

		return $err;
	}
}
?>
