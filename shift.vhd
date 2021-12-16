Library ieee;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;

entity shift_input is
	port
	(
		input_mult : in std_logic_vector(11 downto 0);
		output_mult : out std_logic_vector(11 downto 0);
		shift_select : in std_logic_vector(1 downto 0)
	);
end shift_input;

architecture rtl of shift_input is

begin
	with shift_select SELECT
	output_mult <= input_mult when "00", 
						(input_mult(9 downto 0) & "00")	when "01",
						(input_mult(7 downto 0) & "0000") when "10", 
						"000000000000" when "11";
end rtl;