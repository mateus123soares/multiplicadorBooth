library ieee;
use ieee.std_logic_1164.all;

entity booth is

	port(
		md, mr : in std_logic_vector(5 downto 0); 
		result : out std_logic_vector(2 downto 0)
	);

end entity;
architecture rtl of booth is

signal mr_with_bit : std_logic_vector(6 downto 0);
signal num : std_logic_vector(2 downto 0);

begin
	mr_with_bit <= (mr & '0');
	num <= mr_with_bit(2 downto 0);
	
	dec: decoder port map (
		md_dec => md,
		num_dec => num1,
		result_dec => result
	)
	
end rtl;
