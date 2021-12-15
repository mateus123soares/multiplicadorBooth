Library ieee;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;

entity adder is
	port
	(
		num_add : in std_logic_vector(11 downto 0);
		reg_num_add : in std_logic_vector(11 downto 0);
		result_add : out std_logic_vector(11 downto 0)
	);
end adder;

architecture rtl of adder is

begin

	result_add <= num_add + reg_num_add;

end rtl;