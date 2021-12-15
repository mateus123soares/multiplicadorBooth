library ieee;
use ieee.std_logic_1164.all;

entity booth is

	port(
		md, mr : in std_logic_vector(5 downto 0);
		clk 	 : in std_logic;
		result : out std_logic_vector(11 downto 0)
	);

end entity;

architecture rtl of booth is

component decoder is
	port
	(
		md_dec : in std_logic_vector(5 downto 0);
		num_dec : in std_logic_vector(2 downto 0);
		result_dec : out std_logic_vector(11 downto 0)
	);
end component;

component adder is
	port
	(
		num_add : in std_logic_vector(11 downto 0);
		reg_num_add : in std_logic_vector(11 downto 0);
		result_add : out std_logic_vector(11 downto 0)
	);
end component;

component mux is

	port 
	(
		men1	   : in std_logic_vector (11 downto 0);
		men2	   : in std_logic_vector (11 downto 0);
		men3		: in std_logic_vector (11 downto 0);
		men4		: in std_logic_vector (11 downto 0);
		sel : in std_logic_vector (1 downto 0);
		result_mux : out std_logic_vector (11 downto 0)
	);

end component;

component reg is

	port 
	(
		clk_PO	  : in std_logic;
		init_PO	  : in std_logic;
		write_reg	  : in std_logic;
		input_reg     : in std_logic_vector(11 downto 0);
		output_reg     : out std_logic_vector(11 downto 0)
	);

end component;

signal mr_with_bit : std_logic_vector(6 downto 0);
signal num, num2, num3 : std_logic_vector(2 downto 0);
signal result_dec, result_dec2, result_dec3 : std_logic_vector(11 downto 0);
signal aux, result_aux : std_logic_vector(11 downto 0);

begin
	mr_with_bit <= (mr & '0');
	num <= mr_with_bit(2 downto 0);
	
	dec: decoder port map (
		md_dec => md,
		num_dec => num,
		result_dec => result_dec
	);
	
	dec_mux: mux port map (
		men1 => result_dec,
		men2 => "000000000000",
		men3 => "000000000000",
		men4 => "000000000000",
		sel => "00",
		result_mux => aux
	);
	
	dec_reg: reg port map (
		input_reg => aux,
		clk_PO => clk,
		write_reg => '1',
		init_PO => '0',
		output_reg => result
	);
	
	
	--num2 <= mr_with_bit(4 downto 2);
	
	--aux <= result_dec3(7 downto 0) & "0000";

	--add: adder port map (
		--num_add => result_dec1,
		--reg_num_add => result_dec2,
		--result_add => result_aux
	--);
	
	--add2: adder port map (
	--	num_add => result_aux,
	--	reg_num_add => aux,
	--	result_add => result_dec2
	--);
end rtl;
