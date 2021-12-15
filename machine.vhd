library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity machine is

	port(
		clk_PC,rst_PC		: in std_logic;
		count_PC		: in std_logic_vector (2 downto 0);
		write_reg,write_reg2,write_reg3,init_reg : out std_logic;
		selec_mux : out std_logic_vector(1 downto 0)
	);

end entity;


architecture rtl of machine is

	-- Build an enumerated type for the state machine
	type state_type is (s0, s1);

	-- Register to hold the current state
	signal state: state_type;
	
begin

	-- Logic to advance to the next state
	process (clk_PC)
	begin
		if(rising_edge(clk_PC)) then
			if rst_PC = '1' then
				state <= S0;
			else
				case state is
					when S0=>
						state <= S1;
					when S1=>
						state <= S1;						
				end case;
			end if;
		end if;
	end process;

	-- Output depends solely on the current state

	process (state)
	begin
		case state is
			when s0 =>
				init_reg <= '1';
				write_reg <= '0';
				write_reg2 <= '0';
				write_reg3 <= '0';
				selec_mux <= "00";
			when s1 =>
				init_reg <= '0';
				write_reg <= '1';
				write_reg2 <= '0';
				write_reg3 <= '0';
				selec_mux <= "00";
		end case;
	end process;

end rtl;