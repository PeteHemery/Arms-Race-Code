-- SD_CARD_Interface.vhd

-- This file was auto-generated as part of a SOPC Builder generate operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SD_CARD_Interface is
	port (
		b_SD_cmd             : inout std_logic                     := '0';             --       sd_cmd.export
		b_SD_dat             : inout std_logic                     := '0';             --       sd_dat.export
		b_SD_dat3            : inout std_logic                     := '0';             --      sd_dat3.export
		o_SD_clock           : out   std_logic;                                        --       sd_clk.export
		i_clock              : in    std_logic                     := '0';             --   clock_sink.clk
		i_reset_n            : in    std_logic                     := '0';             --   reset_sink.reset_n
		i_avalon_address     : in    std_logic_vector(7 downto 0)  := (others => '0'); -- avalon_slave.address
		i_avalon_chip_select : in    std_logic                     := '0';             --             .chipselect
		i_avalon_read        : in    std_logic                     := '0';             --             .read
		i_avalon_write       : in    std_logic                     := '0';             --             .write
		i_avalon_byteenable  : in    std_logic_vector(3 downto 0)  := (others => '0'); --             .byteenable
		i_avalon_writedata   : in    std_logic_vector(31 downto 0) := (others => '0'); --             .writedata
		o_avalon_readdata    : out   std_logic_vector(31 downto 0);                    --             .readdata
		o_avalon_waitrequest : out   std_logic                                         --             .waitrequest
	);
end entity SD_CARD_Interface;

architecture rtl of SD_CARD_Interface is
	component Altera_UP_SD_Card_Avalon_Interface is
		generic (
			ADDRESS_BUFFER   : std_logic_vector(7 downto 0) := "00000000";
			ADDRESS_CID      : std_logic_vector(7 downto 0) := "10000000";
			ADDRESS_CSD      : std_logic_vector(7 downto 0) := "10000100";
			ADDRESS_OCR      : std_logic_vector(7 downto 0) := "10001000";
			ADDRESS_SR       : std_logic_vector(7 downto 0) := "10001001";
			ADDRESS_RCA      : std_logic_vector(7 downto 0) := "10001010";
			ADDRESS_ARGUMENT : std_logic_vector(7 downto 0) := "10001011";
			ADDRESS_COMMAND  : std_logic_vector(7 downto 0) := "10001100";
			ADDRESS_ASR      : std_logic_vector(7 downto 0) := "10001101";
			ADDRESS_R1       : std_logic_vector(7 downto 0) := "10001110"
		);
		port (
			b_SD_cmd             : inout std_logic                     := 'X';             -- export
			b_SD_dat             : inout std_logic                     := 'X';             -- export
			b_SD_dat3            : inout std_logic                     := 'X';             -- export
			o_SD_clock           : out   std_logic;                                        -- export
			i_clock              : in    std_logic                     := 'X';             -- clk
			i_reset_n            : in    std_logic                     := 'X';             -- reset_n
			i_avalon_address     : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			i_avalon_chip_select : in    std_logic                     := 'X';             -- chipselect
			i_avalon_read        : in    std_logic                     := 'X';             -- read
			i_avalon_write       : in    std_logic                     := 'X';             -- write
			i_avalon_byteenable  : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			i_avalon_writedata   : in    std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			o_avalon_readdata    : out   std_logic_vector(31 downto 0);                    -- readdata
			o_avalon_waitrequest : out   std_logic                                         -- waitrequest
		);
	end component Altera_UP_SD_Card_Avalon_Interface;

begin

	sd_card_interface : component Altera_UP_SD_Card_Avalon_Interface
		generic map (
			ADDRESS_BUFFER   => "00000000",
			ADDRESS_CID      => "10000000",
			ADDRESS_CSD      => "10000100",
			ADDRESS_OCR      => "10001000",
			ADDRESS_SR       => "10001001",
			ADDRESS_RCA      => "10001010",
			ADDRESS_ARGUMENT => "10001011",
			ADDRESS_COMMAND  => "10001100",
			ADDRESS_ASR      => "10001101",
			ADDRESS_R1       => "10001110"
		)
		port map (
			b_SD_cmd             => b_SD_cmd,             --       sd_cmd.export
			b_SD_dat             => b_SD_dat,             --       sd_dat.export
			b_SD_dat3            => b_SD_dat3,            --      sd_dat3.export
			o_SD_clock           => o_SD_clock,           --       sd_clk.export
			i_clock              => i_clock,              --   clock_sink.clk
			i_reset_n            => i_reset_n,            --   reset_sink.reset_n
			i_avalon_address     => i_avalon_address,     -- avalon_slave.address
			i_avalon_chip_select => i_avalon_chip_select, --             .chipselect
			i_avalon_read        => i_avalon_read,        --             .read
			i_avalon_write       => i_avalon_write,       --             .write
			i_avalon_byteenable  => i_avalon_byteenable,  --             .byteenable
			i_avalon_writedata   => i_avalon_writedata,   --             .writedata
			o_avalon_readdata    => o_avalon_readdata,    --             .readdata
			o_avalon_waitrequest => o_avalon_waitrequest  --             .waitrequest
		);

end architecture rtl; -- of SD_CARD_Interface
