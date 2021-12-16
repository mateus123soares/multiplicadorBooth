library ieee;
use ieee.std_logic_1164.all;

entity booth_top is

end entity;

architecture rtl of booth_top is

component booth is

	port 
	(
		md, mr : in std_logic_vector(5 downto 0);
		input_mr: in std_logic_vector(5 downto 0);
		rst_PC,clk : in std_logic;
		result : out std_logic_vector(11 downto 0)
	);

end component;

signal md_sg, mr_sg : std_logic_vector(5 downto 0);
signal input_mr_sg: std_logic_vector(5 downto 0);
signal rst_PC_sg : std_logic;
signal clk_sg : std_logic := '0';
signal result_sg : std_logic_vector(11 downto 0);

begin
	
	inst_booth: booth port map(
		md => md_sg,
		mr => mr_sg,
		input_mr => input_mr_sg,
		rst_PC => rst_PC_sg,
		clk => clk_sg,
		result => result_sg
	);
	
   clk_sg <= not clk_sg after 100ns;
	process
	begin
		wait for 0ns;
		   md_sg <= "001010";
			mr_sg <= "001010";
			rst_PC_sg <= '1';
			--00110000110010000001110001000110101000110101110011100100000100011110010111111011110000010001100100011010000010100101001011101111
			--n
			--00110000110010000001110001000110101000110101110011100100000100011110010111111011110000010001100100011010000010100101001011101111
		wait for  100ns;
			rst_PC_sg <= '0';
		wait;
	end process;
end rtl;
