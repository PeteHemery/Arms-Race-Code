-- keypad_0.vhd

-- This file was auto-generated as part of a SOPC Builder generate operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity keypad_0 is
	port (
		shift   : out std_logic_vector(31 downto 0);                    --     keypad.readdata
		sys_clk : in  std_logic                     := '0';             -- clock_sink.clk
		resetn  : in  std_logic                     := '0';             -- reset_sink.reset_n
		row     : in  std_logic_vector(3 downto 0)  := (others => '0'); --       rows.export
		col     : out std_logic_vector(3 downto 0)                      --    columns.export
	);
end entity keypad_0;

architecture rtl of keypad_0 is
	component keypad is
		port (
			shift   : out std_logic_vector(31 downto 0);                    -- readdata
			sys_clk : in  std_logic                     := 'X';             -- clk
			resetn  : in  std_logic                     := 'X';             -- reset_n
			row     : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			col     : out std_logic_vector(3 downto 0)                      -- export
		);
	end component keypad;

begin

	keypad_0 : component keypad
		port map (
			shift   => shift,   --     keypad.readdata
			sys_clk => sys_clk, -- clock_sink.clk
			resetn  => resetn,  -- reset_sink.reset_n
			row     => row,     --       rows.export
			col     => col      --    columns.export
		);

end architecture rtl; -- of keypad_0
