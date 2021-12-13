library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity booth is

	generic
	(
		LP_TOP : natural := 3
	);

	port 
	(
		clk_TOP	  : in std_logic;
		rst_TOP	  : in std_logic;
		Mzao_TOP   : in unsigned ((LP_TOP-1) downto 0);
		mzinho_TOP : in unsigned ((LP_TOP-1) downto 0);
		R_TOP 	  : out unsigned ((LP_TOP*2-1) downto 0)
	);

end entity;

architecture rtl of booth is

component Mult_PC is
	generic
	(
		LP_PC : natural := 3
	);

	port(
		clk_PC		: in std_logic;
		rst_PC	 	: in std_logic;
		outm_PC	 	: in std_logic;
		startBit_PC	: in std_logic;
		count_PC		: in unsigned (5 downto 0);
		init_PC	 	: out	std_logic;
		enR_PC	 	: out	std_logic
	);
end component;



signal count_conn: unsigned (5 downto 0);
signal init_conn, enR_conn, outm_conn, startBit_conn: std_logic;

begin

PC_BSN: Mult_PC generic map (LP_PC => LP_TOP)
				 port map (clk_PC => clk_TOP, 
				          rst_PC => rst_TOP, 
							 outm_PC => outm_conn, 
							 startBit_PC => startBit_conn, 
							 count_PC  => count_conn, 
							 init_PC => init_conn, 
							 enR_PC => enR_conn);
				
end rtl;

	



















