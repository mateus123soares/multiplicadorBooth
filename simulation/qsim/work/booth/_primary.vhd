library verilog;
use verilog.vl_types.all;
entity booth is
    port(
        md              : in     vl_logic_vector(5 downto 0);
        mr              : in     vl_logic_vector(5 downto 0);
        result          : out    vl_logic_vector(11 downto 0)
    );
end booth;
