Library ieee;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;

entity decoder is
	port
	(
		md_dec : in std_logic_vector(5 downto 0);
		num_dec : in std_logic_vector(2 downto 0);
		result_dec : out std_logic_vector(6 downto 0)
	);
end decoder;

architecture rtl of decoder is
	signal notMd : std_logic_vector(5 downto 0);
	signal md_mult : std_logic_vector(6 downto 0);
	signal notMd_mult : std_logic_vector(6 downto 0);


begin
	notMd	<= (not md_dec) + '1';
	md_mult <= md_dec & '0';
	notMd_mult <= notMd & '0';
	
	result_dec <= (others => '0') 	when num_dec="000" or num_dec="111"
				 else '1' & md_dec 	when ((num_dec ="001" or num_dec="010") and md_dec(5)='1')
				 else '0' & md_dec 	when ((num_dec ="001" or num_dec="010") and md_dec(5)='0')
				 else md_mult  	when num_dec="011"
				 else notMd_mult  when num_dec="100"
				 else '1' & notMd when ((num_dec ="101" or num_dec="110") and notMd(5)='1')
				 else '0' & notMd	when ((num_dec ="101" or num_dec="110") and notMd(5)='0')
				 else (others => '0');
end rtl;