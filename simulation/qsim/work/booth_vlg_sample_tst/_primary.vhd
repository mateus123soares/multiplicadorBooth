library verilog;
use verilog.vl_types.all;
entity booth_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        md              : in     vl_logic_vector(5 downto 0);
        mr              : in     vl_logic_vector(5 downto 0);
        sampler_tx      : out    vl_logic
    );
end booth_vlg_sample_tst;
