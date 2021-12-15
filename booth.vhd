library ieee;
use ieee.std_logic_1164.all;

entity booth is

	port(
		md, mr : in std_logic_vector(5 downto 0);
		result : out std_logic_vector(11 downto 0);
		input_mr: in std_logic_vector(5 downto 0);
		rst_PC,clk : in std_logic;
		--sinal aux
		saidaReg2,saidaReg3,selec_mux_saida1 : out std_logic_vector(11 downto 0);
		saidaReg1 : out std_logic_vector(11 downto 0);
		selec_mux_saida : out std_logic_vector(1 downto 0);
		write_reg_saida,write_reg2_saida,write_reg3_saida, init_reg_saida : out std_logic
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


component machine is
	port(
		clk_PC,rst_PC		: in std_logic;
		input_mr		: in std_logic_vector (5 downto 0);
		write_reg,write_reg2,write_reg3,init_reg : out std_logic;
		selec_mux : out std_logic_vector(1 downto 0);
		mr_with_bit_n : out std_logic_vector (2 downto 0)
	);

end component;

signal mr_with_bit : std_logic_vector(6 downto 0);
signal num, num2, num3 : std_logic_vector(2 downto 0);
signal result_dec, result_dec2, result_dec3 : std_logic_vector(11 downto 0);
signal output_mux, output_reg1, output_reg2, output_reg3 ,output_add : std_logic_vector(11 downto 0);
signal write_reg,write_reg2,write_reg3,init_reg : std_logic;
signal selec_mux : std_logic_vector(1 downto 0);

begin
	
	state_machine: machine port map(
	clk_PC => clk,
	rst_PC => rst_PC,
	input_mr => mr,
	write_reg => write_reg,
	write_reg2 => write_reg2,
	write_reg3 => write_reg3,
	init_reg => init_reg,
	selec_mux => selec_mux,
	mr_with_bit_n => num
	);
	
	init_reg_saida <= init_reg;
	
	dec: decoder port map (
		md_dec => md,
		num_dec => num,
		result_dec => result_dec
	);
	
	result <= result_dec;
	
	dec_mux: mux port map (
		men1 => result_dec,
		men2 => result_dec,
		men3 => output_reg3,
		men4 => result_dec,
		sel => selec_mux,
		result_mux => output_mux
	);
	
	selec_mux_saida1 <= output_mux;
	selec_mux_saida <= selec_mux;
	
	dec_reg: reg port map (
		input_reg => output_mux,
		clk_PO => clk,
		write_reg => write_reg,
		init_PO => init_reg,
		output_reg => output_reg1
	);
	
	--excluir
	saidaReg1 <= output_reg1;
	write_reg_saida <= write_reg;
	
	dec_reg2: reg port map (
		input_reg => output_mux,
		clk_PO => clk,
		write_reg => write_reg2,
		init_PO => '0',
		output_reg => output_reg2
	);
	
	--excluir
	saidaReg2 <= output_reg2;
	write_reg2_saida <= write_reg2;
	
	add: adder port map (
		num_add => output_reg1,
		reg_num_add => output_reg2,
		result_add => output_add
	);	
		
	add_reg: reg port map (
		input_reg => output_add,
		clk_PO => clk,
		write_reg => write_reg3,
		init_PO => '0',
		output_reg => output_reg3
	);
	
	--excluir
	saidaReg3 <= output_reg3;
	write_reg3_saida <= write_reg3;



	
end rtl;
