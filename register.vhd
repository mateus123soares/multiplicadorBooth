
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Mult_PO is

	port 
	(
		clk_PO	  : in std_logic;
		init_PO	  : in std_logic;
		write_reg	  : in std_logic;
		input_reg     : in std_logic_vector(11 downto 0);
		output_reg     : out std_logic_vector(11 downto 0)
	);

end entity;


		
architecture rtl of Mult_PO is

signal input_reg_signal: std_logic_vector(11 downto 0);
signal count_reg: unsigned (5 downto 0);
signal Mzao_reg, R: unsigned ((LP_PO*2-1) downto 0);

begin

	process(clk_PO)is
	begin
		if (rising_edge(clk_PO))then
			if (init_PO = '1') then
				output_reg <= "000000000000"
			else
				input_reg_signal <= input_reg;
				if (write_reg = '1') then
					output_reg <= input_reg_signal
				end if;
			end if;
		end if;
	end process;
	
end rtl; 














