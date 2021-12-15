library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity machine is

	port(
		clk_PC,rst_PC		: in std_logic;
		input_mr		: in std_logic_vector (5 downto 0);
		write_reg,write_reg2,write_reg3,init_reg : out std_logic;
		selec_mux : out std_logic_vector(1 downto 0);
		mr_with_bit_n : out std_logic_vector (2 downto 0);
		out_add : out std_logic_vector(1 downto 0)
	);

end entity;


architecture rtl of machine is

	-- Build an enumerated type for the state machine
	type state_type is (s0, s1, s2,s3,s4,s5,s6);

	-- Register to hold the current state
	signal state: state_type;
	signal mr_with_bit : std_logic_vector(6 downto 0);
	signal num : std_logic_vector(2 downto 0);
	
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
						state <= S2;
					when S2=>
						state <= S3;
					when S3=>
						state <= S4;	
					when S4=>
						state <= S5;						
					when S5=>
						state <= S6;
					when S6=>
						state <= S6;
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
				mr_with_bit <= (input_mr & '0');
				mr_with_bit_n <= mr_with_bit(2 downto 0);
				out_add <= "00";
			when s1 =>
				init_reg <= '0';
				write_reg <= '1';
				write_reg2 <= '0';
				write_reg3 <= '0';
				selec_mux <= "00";
				mr_with_bit <= (input_mr & '0');
				mr_with_bit_n <= mr_with_bit(2 downto 0);
				out_add <= "01";
			when s2 =>
				init_reg <= '0';
				write_reg <= '0';
				write_reg2 <= '1';
				write_reg3 <= '0';
				selec_mux <= "01";
				mr_with_bit <= (input_mr & '0');
				mr_with_bit_n <= mr_with_bit(4 downto 2);
				out_add <= "01";
			when s3 =>
				init_reg <= '0';
				write_reg <= '0';
				write_reg2 <= '0';
				write_reg3 <= '1';
				selec_mux <= "01";
				mr_with_bit <= (input_mr & '0');
				mr_with_bit_n <= mr_with_bit(4 downto 2);
				out_add <= "01";
			when s4 =>
				init_reg <= '0';
				write_reg <= '1';
				write_reg2 <= '0';
				write_reg3 <= '0';
				selec_mux <= "10";
				mr_with_bit <= (input_mr & '0');
				mr_with_bit_n <= mr_with_bit(6 downto 4);
				out_add <= "10";
			when s5 =>
				init_reg <= '0';
				write_reg <= '0';
				write_reg2 <= '1';
				write_reg3 <= '0';
				selec_mux <= "11";
				mr_with_bit <= (input_mr & '0');
				mr_with_bit_n <= mr_with_bit(6 downto 4);
				out_add <= "10";
			when s6 =>
				init_reg <= '0';
				write_reg <= '0';
				write_reg2 <= '0';
				write_reg3 <= '1';
				selec_mux <= "11";
				mr_with_bit <= (input_mr & '0');
				mr_with_bit_n <= mr_with_bit(6 downto 4);
				out_add <= "00";
		end case;
	end process;

end rtl;