library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;               -- changed from unsigned.
-- use work.COUNTDOWN_PACKAGE.all;
-- library altera;
-- use altera.maxplus2.all;

-- Title "Keypad encoder circuit"
-- Prepared by: D.N. Warren-Smith
-- Updated: 14 February 2001
-- Modified by N. J. Gunton
-- Date 6th February 2008 & March 2011

-- Modified by Pete Hemery
-- Date 28/02/2011

-- the original can be found at
-- http://users.senet.com.au/~dwsmith/vhdl.htm#top

-- connect strobe to drive the interrupt line?

entity keypad_controller is
  port (
    sys_clk : in  std_logic;                      -- Clock source and
    resetn  : in  std_logic;                      -- Reset on global inputs
--    strobe : out    std_logic;                  -- key pressed
    row     : in  std_logic_vector (3 downto 0);  -- Sense keypad rows
    col     : out std_logic_vector (3 downto 0);  -- Drive columns
    shift   : out std_logic_vector (31 downto 0));
end keypad_controller;

architecture keys of keypad_controller is
  signal key_pressed : std_logic;       -- High when a key pressed
  signal NKP         : std_logic;
  signal latch_n     : std_logic; -- PH added to send changes to software
  signal mat         : std_logic_vector (3 downto 0);  -- key conversion matrix
  signal d           : unsigned(3 downto 0);  -- Control counter
  signal cnt         : unsigned (1 downto 0);  -- used in key debounce
  signal divider     : unsigned(15 downto 0);
                                        -- used for keypad scan clock generation
  signal clk         : std_logic;       -- internal clk
  signal pulse       : std_logic;
  signal inp0        : std_logic_vector(3 downto 0);

begin

  -- Scan the keyboard until a key is pressed
  process (clk, key_pressed, resetn)
  begin
    if (clk'event and clk = '1') then
      if (resetn = '0') then
        d <= "0000";  -- synchronous reset
      else
        if (key_pressed = '0') then
          d <= d + 1;
        end if;
      end if;  -- Counter stops counting when a key is pressed
    end if;
  end process;

  -- Column drivers, active low

  col(0) <= '0' when d(3 downto 2) = "00" else '1';
  col(1) <= '0' when d(3 downto 2) = "01" else '1';
  col(2) <= '0' when d(3 downto 2) = "10" else '1';
  col(3) <= '0' when d(3 downto 2) = "11" else '1';

  -- Sense keyboard rows with a multiplexer
  -- double inversion ughh
  -- keypad gives 0 when key pressed
  
  -- PH modded the matrix so keypad can be upside down

with d select
  mat <=                -- button, col, row
  "1100"      when "0000", -- 11 -- 0,  0
  "1000"      when "0001", -- 8  -- 0,  1
  "0100"      when "0010", -- 4  -- 0,  2
  "0000"      when "0011", -- 0  -- 0,  3
  "1101"      when "0100", -- 13 -- 1,  0
  "1001"      when "0101", -- 9  -- 1,  1
  "0101"      when "0110", -- 5  -- 1,  2
  "0001"      when "0111", -- 1  -- 1,  3
  "1110"      when "1000", -- 14 -- 2,  0
  "1010"      when "1001", -- 10 -- 2,  1
  "0110"      when "1010", -- 6  -- 2,  2
  "0010"      when "1011", -- 2  -- 2,  3
  "1111"      when "1100", -- 15 -- 3,  0
  "1011"      when "1101", -- 11 -- 3,  1
  "0111"      when "1110", -- 7  -- 3,  2
  "0011"      when "1111", -- 3  -- 3,  3
  "0000"      when others;
  
  with d(1 downto 0) select
    key_pressed <= not row(3) when "11",
                   not row(2) when "10",
                   not row(1) when "01",
                   not row(0) when others;

  NKP           <= not key_pressed;

  -- Generate strobe when key press has settled
  -- st : debounce port map(clk, NKP, strobe);
  -- below is hacked process from debounce module

  process (clk, NKP, pulse)
  begin
    if NKP = '1' then
      cnt      <= to_unsigned(0, 2);
		latch_n <= '1';
    else
      if (clk'event and clk = '1') then
        if (cnt /= to_unsigned(3, 2)) then
          cnt    <= cnt + to_unsigned(1, 2);
        end if;
      end if;
      if (cnt = to_unsigned(2, 2)) and (NKP = '0') then
        pulse     <= '1';
		  latch_n <= '0'; 
      else
        pulse   <= '0';
      end if;
		
    end if;
  end process;
  
  
  
-- latch key value (from matrix) when we get a pulse
  process (clk,resetn,pulse,mat)
  begin
    if resetn = '0' then                -- asynchronous clear
      inp0   <= "0000";
    else
      if (clk'event and clk = '1') then
        if pulse = '1' then               -- left shift mat into shift register
          inp0 <= mat;
        end if;
      end if;
    end if;
  end process;

  -- shift is padded to 32 bits to keep sopc_builder happy ;-) NJG
  
  -- PH 28/02/2012 added NKP and pulse into the shift register
  -- NKP indicates when no key is pressed
  -- pulse indicates that inp0 is the latched value

  -- PH 3/11/2012 changed NKP & pulse to latch_n
  
  shift <= "000000000000000000000000000"&latch_n&inp0;

  -- PH 29/02/2012 keeping as just inp0 for strobe interrupt
--  shift <= "0000000000000000000000000000"&inp0;
  -- PH added strobe to drive interrupt line
--  strobe  <= pulse;
 --shift <= inp0;

--end;


-- purpose: takes the system clock and drops it to 2mS clock
-- type : sequential
-- inputs : sys_clk, resetn
-- outputs: clk
clock_div : process (sys_clk, resetn)
begin  -- process clock_div
  if resetn = '0' then                  -- asynchronous reset (active low)
    divider   <= to_unsigned(0, 16);
    clk       <= '0';
  elsif sys_clk'event and sys_clk = '1' then  -- rising clock edge
    if divider = X"8235" then
      clk     <= not clk;
      divider <= to_unsigned(0, 16);
    else
      divider <= divider + to_unsigned(1, 16);
    end if;

  end if;
end process clock_div;

end;


