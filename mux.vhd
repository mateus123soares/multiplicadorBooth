library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux is

	port 
	(
		men1	   : in std_logic_vector (11 downto 0);
		men2	   : in std_logic_vector (11 downto 0);
		men3		: in std_logic_vector (11 downto 0);
		men4		: in std_logic_vector (11 downto 0);
		sel : in std_logic_vector (1 downto 0);
		result_mux : out std_logic_vector (11 downto 0)
	);

end entity;

architecture rtl of mux is
begin
	with sel SELECT
	result_mux <= men1 when "00", 
				 men2	when "01",
				 men3	when "10", 
				 men4 when "11",
				 "000000000000" when others;
				
end rtl;