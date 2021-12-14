library verilog;
use verilog.vl_types.all;
entity booth_vlg_check_tst is
    port(
        result          : in     vl_logic_vector(11 downto 0);
        sampler_rx      : in     vl_logic
    );
end booth_vlg_check_tst;
