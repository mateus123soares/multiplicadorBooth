library verilog;
use verilog.vl_types.all;
entity booth is
    port(
        md              : in     vl_logic_vector(5 downto 0);
        mr              : in     vl_logic_vector(5 downto 0);
        result          : out    vl_logic_vector(11 downto 0);
        count_PC        : in     vl_logic_vector(2 downto 0);
        rst_PC          : in     vl_logic;
        clk             : in     vl_logic;
        saidaReg2       : out    vl_logic_vector(11 downto 0);
        saidaReg3       : out    vl_logic_vector(11 downto 0);
        selec_mux_saida1: out    vl_logic_vector(11 downto 0);
        saidaReg1       : out    vl_logic_vector(11 downto 0);
        selec_mux_saida : out    vl_logic_vector(1 downto 0);
        write_reg_saida : out    vl_logic;
        write_reg2_saida: out    vl_logic;
        write_reg3_saida: out    vl_logic
    );
end booth;
