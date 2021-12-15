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
	type state_type is (s0, s1, s2, s3);

	-- Register to hold the current state
	signal state: state_type;	
	constant limit: unsigned(5 downto 0):= (0|1=> '1', others => '0');
	
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
							if (count_PC = "000") then
								state <= S1;
							end if;
					when S1=>
							if (count_PC = "001") then
								state <= S2;
							end if;
							
					when S2=>
							if (count_PC = "010") then
								state <= S3;
							end if;
					when S3 =>
							if (count_PC = "011") then
								state <= S3;
							end if;								
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
			when s2 =>
			   write_reg <= '0';
				write_reg2 <= '1';
				write_reg3 <= '0';
				selec_mux <= "01";
			when s3 =>
			   write_reg <= '0';
				write_reg2 <= '0';
				write_reg3 <= '1';
				selec_mux <= "10";
		end case;
	end process;

end rtl;