library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity reg is

	port 
	(
		clk_PO	  : in std_logic;
		init_PO	  : in std_logic;
		write_reg	  : in std_logic;
		input_reg     : in std_logic_vector(11 downto 0);
		output_reg     : out std_logic_vector(11 downto 0)
	);

end entity;


		
architecture rtl of reg is

signal input_reg_signal: std_logic_vector(11 downto 0);
signal count_reg: unsigned (5 downto 0);

begin

	process(clk_PO)is
	begin
		if (rising_edge(clk_PO))then
			if (init_PO = '1') then
				output_reg <= "100000000001";
			else
				if (write_reg = '1') then
					output_reg <= input_reg;
				end if;
			end if;
		end if;
	end process;
	
end rtl; 















