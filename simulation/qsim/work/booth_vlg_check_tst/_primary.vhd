library verilog;
use verilog.vl_types.all;
entity booth_vlg_check_tst is
    port(
        init_reg_saida  : in     vl_logic;
        result          : in     vl_logic_vector(11 downto 0);
        saida_adder     : in     vl_logic_vector(11 downto 0);
        saida_shift     : in     vl_logic_vector(11 downto 0);
        saidaReg1       : in     vl_logic_vector(11 downto 0);
        saidaReg2       : in     vl_logic_vector(11 downto 0);
        saidaReg3       : in     vl_logic_vector(11 downto 0);
        selec_mux_saida : in     vl_logic_vector(1 downto 0);
        selec_mux_saida1: in     vl_logic_vector(11 downto 0);
        write_reg2_saida: in     vl_logic;
        write_reg3_saida: in     vl_logic;
        write_reg_saida : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end booth_vlg_check_tst;
